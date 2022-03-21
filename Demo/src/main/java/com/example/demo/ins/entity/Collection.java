package com.example.demo.ins.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author jiangFly
 * @since 2022-02-15
 */
@ApiModel(value = "Collection对象", description = "")
public class Collection implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer userId;

    private Integer rentId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public Integer getRentId() {
        return rentId;
    }

    public void setRentId(Integer rentId) {
        this.rentId = rentId;
    }

    @Override
    public String toString() {
        return "Collection{" +
            "id=" + id +
            ", userId=" + userId +
            ", rentId=" + rentId +
        "}";
    }
}
