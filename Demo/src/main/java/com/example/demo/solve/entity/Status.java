package com.example.demo.solve.entity;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;


public enum Status {
    Processed(1,"已处理"),NotProcessed(0,"未处理");
    @EnumValue
    private int code;
    @JsonValue
    private String name;

    public int getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    Status(int code, String name) {
        this.code = code;
        this.name = name;
    }
}
