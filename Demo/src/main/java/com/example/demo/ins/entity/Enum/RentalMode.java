package com.example.demo.ins.entity.Enum;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * @Author jeff
 * @Date 15/02/2022 10:44
 * @Version 1.0
 * @Description:
 */
public enum RentalMode {
    Share(1,"合租"),WholeRent(2,"整租"),Unlimited(3,"不限");
    @EnumValue
    private Integer code;
    @JsonValue
    private String value;

    RentalMode(Integer code, String value) {
        this.code = code;
        this.value = value;
    }

    public Integer getCode() {
        return code;
    }

    public String getValue() {
        return value;
    }
}
