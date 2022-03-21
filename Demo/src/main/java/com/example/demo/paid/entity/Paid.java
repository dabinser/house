package com.example.demo.paid.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.example.demo.ins.entity.Enum.Status;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * <p>
 *
 * </p>
 *
 * @author jiangFly
 * @since 2022-03-21
 */
@ApiModel(value = "Paid对象", description = "")
public class Paid implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("地址")
    private String address;

    @ApiModelProperty("价格")
    private Double price;

    @ApiModelProperty("应付日期")
    private LocalDate date;

    @ApiModelProperty("付款日期")
    private LocalDate paydate;

    @ApiModelProperty("租客")
    private String name;

    @ApiModelProperty("出租人")
    private Integer owner;

    @ApiModelProperty("状态")
    private Status status;

    private Integer houseId;

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
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
    public LocalDate getPaydate() {
        return paydate;
    }

    public void setPaydate(LocalDate paydate) {
        this.paydate = paydate;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public Integer getOwner() {
        return owner;
    }

    public void setOwner(Integer owner) {
        this.owner = owner;
    }

    @Override
    public String toString() {
        return "Paid{" +
                "id=" + id +
                ", address='" + address + '\'' +
                ", price=" + price +
                ", date=" + date +
                ", paydate=" + paydate +
                ", name='" + name + '\'' +
                ", owner=" + owner +
                ", status=" + status +
                ", houseId=" + houseId +
                '}';
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

}
