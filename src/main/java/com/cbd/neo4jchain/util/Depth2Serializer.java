package com.cbd.neo4jchain.util;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.Node;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

public class Depth2Serializer extends JsonSerializer<Object> {

    @Override
    public void serialize(Object value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        serializeObject(value, gen, 0);
    }

    private void serializeObject(Object value, JsonGenerator gen, int depth) throws IOException {
        if (value == null)
            return;

        gen.writeStartObject();
        List<Field> fields = getAllFields(value.getClass());
        for (Field field : fields) {
            field.setAccessible(true);
            try {
                Object fieldValue = field.get(value);
                if (fieldValue == null)
                    continue;

                String fieldName = field.getName();

                if (Collection.class.isAssignableFrom(field.getType())) {
                    Collection<?> collection = (Collection<?>) fieldValue;
                    List<Object> serializedList = new ArrayList<>();

                    for (Object item : collection) {
                        if (item == null)
                            continue;
                        if (isNodeEntity(item.getClass())) {
                            if (depth == 0) {
                                // profundidad 1 -> serializa objeto completo
                                serializedList.add(getSerializedMap(item, 1));
                            } else {
                                // profundidad 2+ -> sólo id
                                serializedList.add(getIdFromNode(item));
                            }
                        } else {
                            serializedList.add(item);
                        }
                    }

                    gen.writeObjectField(fieldName, serializedList);
                } else if (isNodeEntity(fieldValue.getClass())) {
                    if (depth == 0) {
                        // profundidad 1 -> serializa objeto completo
                        gen.writeFieldName(fieldName);
                        serializeObject(fieldValue, gen, 1);
                    } else {
                        // profundidad 2+ -> solo ID
                        gen.writeObjectField(fieldName, getIdFromNode(fieldValue));
                    }
                } else {
                    gen.writeObjectField(fieldName, fieldValue);
                }

            } catch (IllegalAccessException e) {
                throw new RuntimeException("Error al acceder al campo " + field.getName(), e);
            }
        }
        gen.writeEndObject();
    }

    private Map<String, Object> getSerializedMap(Object node, int depth) {
        Map<String, Object> map = new LinkedHashMap<>();

        for (Field field : getAllFields(node.getClass())) {
            field.setAccessible(true);
            try {
                Object value = field.get(node);
                if (value == null)
                    continue;

                if (Collection.class.isAssignableFrom(field.getType())) {
                    Collection<?> collection = (Collection<?>) value;
                    List<Object> ids = new ArrayList<>();

                    for (Object item : collection) {
                        if (item != null && isNodeEntity(item.getClass())) {
                            ids.add(getIdFromNode(item));
                        } else {
                            ids.add(item);
                        }
                    }
                    map.put(field.getName(), ids);
                } else if (isNodeEntity(value.getClass())) {
                    map.put(field.getName(), getIdFromNode(value));
                } else {
                    map.put(field.getName(), value);
                }

            } catch (IllegalAccessException e) {
                throw new RuntimeException("No se pudo serializar campo interno: " + field.getName(), e);
            }
        }

        return map;
    }

    private boolean isNodeEntity(Class<?> clazz) {
        return clazz.isAnnotationPresent(Node.class);
    }

    private Object getIdFromNode(Object node) {
        for (Field field : getAllFields(node.getClass())) {
            if (field.isAnnotationPresent(Id.class) || field.getName().equals("id")) {
                try {
                    field.setAccessible(true);
                    return field.get(node);
                } catch (IllegalAccessException e) {
                    throw new RuntimeException("No se puede acceder al id en: " + node.getClass(), e);
                }
            }
        }
        throw new RuntimeException("No se encontró campo ID en: " + node.getClass());
    }

    private List<Field> getAllFields(Class<?> type) {
        List<Field> fields = new ArrayList<>();
        while (type != null && type != Object.class) {
            fields.addAll(Arrays.asList(type.getDeclaredFields()));
            type = type.getSuperclass();
        }
        return fields;
    }
}