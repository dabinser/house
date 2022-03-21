package com.example.demo.tool.result.Enum;

public enum state {
    NotFound("用户名或密码错误"),LogOn("登录成功");
    private String code;

    private state(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
