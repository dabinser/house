package com.example.demo.solve.entity;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 
 * </p>
 *
 * @author jiangfly
 * @since 2022-03-27
 */
@ApiModel(value = "Solve对象", description = "")
public class Solve implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("地址")
    private String address;

    @ApiModelProperty("上报日期")
    private LocalDateTime date;

    @ApiModelProperty("保修人")
    private String name;

    @ApiModelProperty("详情")
    private String detail;

    @ApiModelProperty("状态")

    private Status status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Solve{" +
            "id=" + id +
            ", address=" + address +
            ", date=" + date +
            ", name=" + name +
            ", detail=" + detail +
            ", status=" + status +
        "}";
    }
}
