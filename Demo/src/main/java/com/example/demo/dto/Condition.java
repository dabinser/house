package com.example.demo.dto;

import com.example.demo.ins.entity.Enum.*;
import com.example.demo.tool.Baseseach.Basepage;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * @Author jeff
 * @Date 15/02/2022 10:34
 * @Version 1.0
 * @Description:
 */
public class Condition implements Serializable {
    @ApiModelProperty("地址范围")
    private String address;
    @ApiModelProperty("最低价格")
    private Integer minPrice;
    @ApiModelProperty("最高价格")
    private Integer maxPrice;
    @ApiModelProperty("出租方式")
    private RentalMode mode;
    @ApiModelProperty("楼层")
    private Storey storey;
    @ApiModelProperty("朝向")
    private Orientation orientation;
    @ApiModelProperty("电梯")
    private Elevator elevator;
    @ApiModelProperty("是否出租")
    private Status is_rent;
    @ApiModelProperty("page")
    private Basepage basepage;

    @Override
    public String toString() {
        return "Condition{" +
                "address='" + address + '\'' +
                ", minPrice=" + minPrice +
                ", maxPrice=" + maxPrice +
                ", mode=" + mode +
                ", storey=" + storey +
                ", orientation=" + orientation +
                ", elevator=" + elevator +
                ", is_rent=" + is_rent +
                ", basepage=" + basepage +
                ", order='" + order + '\'' +
                '}';
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    @ApiModelProperty("排序")
    private String order;

    public Condition() {
    }

    public Basepage getBasepage() {
        return basepage;
    }

    public void setBasepage(Basepage basepage) {
        this.basepage = basepage;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Integer minPrice) {
        this.minPrice = minPrice;
    }

    public Integer getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Integer maxPrice) {
        this.maxPrice = maxPrice;
    }

    public RentalMode getMode() {
        return mode;
    }

    public void setMode(RentalMode mode) {
        this.mode = mode;
    }

    public Storey getStorey() {
        return storey;
    }

    public void setStorey(Storey storey) {
        this.storey = storey;
    }

    public Orientation getOrientation() {
        return orientation;
    }

    public void setOrientation(Orientation orientation) {
        this.orientation = orientation;
    }

    public Elevator getElevator() {
        return elevator;
    }

    public void setElevator(Elevator elevator) {
        this.elevator = elevator;
    }

    public Status getIs_rent() {
        return is_rent;
    }

    public void setIs_rent(Status is_rent) {
        this.is_rent = is_rent;
    }

}
