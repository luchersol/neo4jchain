package com.cbd.neo4jchain.exception;

public class NoUpdateAllowed extends IllegalArgumentException {
    
    public NoUpdateAllowed(Class<?> clazz, String property, Object value) {
        super(String.format("%s you cannot modify a closed issue %s: %s", clazz.getSimpleName(), property, value));
    }

}
