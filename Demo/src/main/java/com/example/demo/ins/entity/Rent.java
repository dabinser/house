package com.example.demo.ins.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.example.demo.ins.entity.Enum.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * <p>
 *
 * </p>
 *
 * @author j
 * @since 2021-12-16
 */
@Data
@ApiModel(value = "Rent对象", description = "")
public class Rent implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键")
    @TableId
    private int id;

    @ApiModelProperty("信息编码")
    private String rcode;

    @ApiModelProperty("会员账号")
    private String vname;

    @ApiModelProperty("标题")
    private String title;

    @ApiModelProperty("地区")
    private String area;

    @ApiModelProperty("小区名")
    private String community;

    @ApiModelProperty("租金")
    private Float pay;
    @ApiModelProperty("是否出租")
    private Status is_rent;

    @ApiModelProperty("详情描述")
    private String content;

    @ApiModelProperty("联系人")
    private String contacts;

    @ApiModelProperty("联系电话")
    private String phone;
    @TableField(exist = true)
    @ApiModelProperty("户型")
    private String apartmentType;
    @ApiModelProperty("出租方式")
    private RentalMode mode;
    @ApiModelProperty("楼层高度")
    private Storey storey;
    @ApiModelProperty("电梯")
    private Elevator elevator;
    @ApiModelProperty("朝向")
    private Orientation orientation;
    @ApiModelProperty("用户id")
    private Integer sysUserId;
    @TableField(exist = true)
    @ApiModelProperty("图片url")
    private ArrayList<String> list;



    public String getRcode() {
        return rcode;
    }

    public void setRcode(String rcode) {
        this.rcode = rcode;
    }
    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
    public String getCommunity() {
        return community;
    }

    public void setCommunity(String community) {
        this.community = community;
    }
    public Float getPay() {
        return pay;
    }

    public void setPay(Float pay) {
        this.pay = pay;
    }
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public Elevator getElevator() {
        return elevator;
    }

    public void setElevator(Elevator elevator) {
        this.elevator = elevator;
    }

    public Orientation getOrientation() {
        return orientation;
    }

    public void setOrientation(Orientation orientation) {
        this.orientation = orientation;
    }

    public Status getIs_rent() {
        return is_rent;
    }

    public void setIs_rent(Status is_rent) {
        this.is_rent = is_rent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getSysUserId() {
        return sysUserId;
    }

    public void setSysUserId(Integer sysUserId) {
        this.sysUserId = sysUserId;
    }

    public ArrayList<String> getList() {
        return list;
    }

    public void setList(ArrayList<String> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "Rent{" +
                "id=" + id +
                ", rcode='" + rcode + '\'' +
                ", vname='" + vname + '\'' +
                ", title='" + title + '\'' +
                ", area='" + area + '\'' +
                ", community='" + community + '\'' +
                ", pay=" + pay +
                ", is_rent=" + is_rent +
                ", content='" + content + '\'' +
                ", contacts='" + contacts + '\'' +
                ", phone='" + phone + '\'' +
                ", apartmentType='" + apartmentType + '\'' +
                ", mode=" + mode +
                ", storey=" + storey +
                ", elevator=" + elevator +
                ", orientation=" + orientation +
                ", sysUserId=" + sysUserId +
                ", list=" + list +
                '}';
    }

    public String getApartmentType() {
        return apartmentType;
    }

    public void setApartmentType(String apartmentType) {
        this.apartmentType = apartmentType;
    }

}
