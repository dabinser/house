package com.example.demo.ins.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author jiangFly
 * @since 2022-02-23
 */
@ApiModel(value = "Documentfile对象", description = "")
public class Documentfile implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("路径")
    private String url;

    @ApiModelProperty("外键")
    private Integer rentId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    public Integer getRentId() {
        return rentId;
    }

    public void setRentId(Integer rentId) {
        this.rentId = rentId;
    }

    @Override
    public String toString() {
        return "Documentfile{" +
            "id=" + id +
            ", url=" + url +
            ", rentId=" + rentId +
        "}";
    }
}
