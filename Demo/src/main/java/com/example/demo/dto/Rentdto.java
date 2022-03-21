package com.example.demo.dto;

import com.example.demo.tool.Baseseach.Basepage;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class Rentdto extends Basepage {
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

    @ApiModelProperty("详情描述")
    private String content;

    @ApiModelProperty("图片")
    private byte[] picture;

    @ApiModelProperty("联系人")
    private String contacts;

    @ApiModelProperty("联系电话")
    private String phone;

}
