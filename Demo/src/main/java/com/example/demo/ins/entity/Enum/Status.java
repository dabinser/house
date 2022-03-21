package com.example.demo.ins.entity.Enum;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * @Author jeff
 * @Date 09/03/2022 10:23
 * @Version 1.0
 * @Description:
 */
public enum Status {
    Rent(1,"已出租"),No_Rent(0,"未出租");
    @EnumValue
    private Integer Code;
    @JsonValue
    private String Value;

    Status(Integer code, String value) {
        Code = code;
        Value = value;
    }

    public Integer getCode() {
        return Code;
    }

    public String getValue() {
        return Value;
    }
}
