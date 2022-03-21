package com.example.demo.ins.entity.Enum;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * @Author jeff
 * @Date 15/02/2022 11:00
 * @Version 1.0
 * @Description:
 */
public enum Elevator {
    Have(1,"有"),None(0,"无");
    @EnumValue
    Integer code;
    @JsonValue
    String value;


    Elevator(Integer code, String value) {
        this.code = code;
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public Integer getCode() {
        return code;
    }
}
