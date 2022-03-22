package com.example.demo.dto;/**
 * @Author jeff
 * @Date 21/03/2022 16:11
 * @Version 1.0
 * @Description:
 */

import com.example.demo.ins.entity.Enum.Status;
import com.example.demo.tool.Baseseach.Basepage;

import java.io.Serializable;

/**
 *@ClassName paidCondition
 *@Author jeffjliu
 *@Date 21/03/2022 16:11
 **/
public class paidCondition implements Serializable {
    private Basepage basepage;
    private Status status;

    @Override
    public String toString() {
        return "paidCondition{" +
                "basepage=" + basepage +
                ", status=" + status +
                '}';
    }

    public Basepage getBasepage() {
        return basepage;
    }

    public void setBasepage(Basepage basepage) {
        this.basepage = basepage;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
