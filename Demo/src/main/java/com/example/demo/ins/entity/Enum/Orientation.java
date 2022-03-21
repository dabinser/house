package com.example.demo.ins.entity.Enum;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * @Author jeff
 * @Date 15/02/2022 10:53
 * @Version 1.0
 * @Description:
 */
public enum Orientation {
    East(1,"东"),South(2,"南") ,North(3,"西"),West(4,"北");
    @JsonValue
    private String value;
    @EnumValue
    private Integer code;

    Orientation(Integer code,String value ) {
        this.value = value;
        this.code = code;
    }

    public String getValue() {
        return value;
    }

    public Integer getCode() {
        return code;
    }
}
