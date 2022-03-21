package com.example.demo.tool.Convertor;

import org.springframework.core.convert.converter.Converter;

import java.util.HashMap;
import java.util.Map;

public class BaseEnumConverter<T extends Enum> implements Converter<String, T> {
    private Map<String, T> enumMap = new HashMap<>();
    public BaseEnumConverter(Class<T> enumType) {
        T[] enums = enumType.getEnumConstants();
        for (T e : enums) {
            enumMap.put(String.valueOf(e.ordinal()), e);
            enumMap.put(e.name(), e);
        }
    }
    @Override
    public T convert(String source) {
        T t1 = enumMap.get(source.toLowerCase());
        T t2 = enumMap.get(source.toUpperCase());
        if (t1 == null && t2 == null) {
            throw new IllegalArgumentException("无法匹配对应的枚举类型");
        }
        return t1 == null ? t2 : t1;
    }
}
