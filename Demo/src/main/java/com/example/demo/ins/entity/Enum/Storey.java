package com.example.demo.ins.entity.Enum;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * @Author jeff
 * @Date 15/02/2022 11:04
 * @Version 1.0
 * @Description:
 */
public enum Storey {
    Height(3,"高"),Middle(2,"中"),Low(1,"低");
    @EnumValue
    private Integer code;
    @JsonValue
    String value;

    Storey(Integer code, String value) {
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
