package com.cbd.neo4jchain.exception;

public class NotFoundResource extends IllegalArgumentException {

    public NotFoundResource(Class<?> clazz, String property, Object value) {
        super(String.format("%s not found with %s: %s", clazz.getSimpleName(), property, value));
    }

    public static NotFoundResource of(Class<?> clazz, String property, Object value) {
        return new NotFoundResource(clazz, property, value);
    }
}
