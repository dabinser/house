package com.example.demo.dto;

import com.example.demo.User.entity.SysUser;
import com.example.demo.tool.Baseseach.Basepage;

import java.io.Serializable;

public class UserConditionDto implements Serializable {
    private SysUser user;
    private Basepage basepage;

    @Override
    public String toString() {
        return "UserConditionDto{" +
                "user=" + user +
                ", basepage=" + basepage +
                '}';
    }

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    public Basepage getBasepage() {
        return basepage;
    }

    public void setBasepage(Basepage basepage) {
        this.basepage = basepage;
    }
}
