package com.example.demo.ins.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * <p>
 *
 * </p>
 *
 * @author j
 * @since 2021-12-16
 */
@ApiModel(value = "Dialogue对象", description = "")
public class Dialogue implements Serializable {

    private static final long serialVersionUID = 1L;
    @TableId
    private int id;

    @ApiModelProperty("编号")
    private String num;

    @ApiModelProperty("发送者")
    private String send;

    @ApiModelProperty("接受者")
    private String receive;

    @ApiModelProperty("状态")
    private String state;

    @ApiModelProperty("过期时间")
    private LocalDate outtime;

    @ApiModelProperty("发送时间")
    private LocalDate sendtime;

    @ApiModelProperty("大小")
    private Float dsize;

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }
    public String getSend() {
        return send;
    }

    public void setSend(String send) {
        this.send = send;
    }
    public String getReceive() {
        return receive;
    }

    public void setReceive(String receive) {
        this.receive = receive;
    }
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    public LocalDate getOuttime() {
        return outtime;
    }

    public void setOuttime(LocalDate outtime) {
        this.outtime = outtime;
    }
    public LocalDate getSendtime() {
        return sendtime;
    }

    public void setSendtime(LocalDate sendtime) {
        this.sendtime = sendtime;
    }
    public Float getDsize() {
        return dsize;
    }

    public void setDsize(Float dsize) {
        this.dsize = dsize;
    }

    @Override
    public String toString() {
        return "Dialogue{" +
            "num=" + num +
            ", send=" + send +
            ", receive=" + receive +
            ", state=" + state +
            ", outtime=" + outtime +
            ", sendtime=" + sendtime +
            ", dsize=" + dsize +
        "}";
    }
}
