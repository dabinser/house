package com.example.demo.dto;/**
 * @Author jeff
 * @Date 10/03/2022 12:14
 * @Version 1.0
 * @Description:
 */

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *@ClassName UserDto
 *@Author jeffjliu
 *@Date 10/03/2022 12:14
 **/
public class UserDto implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("用户ID（可设置唯一索引UNIQUE）")
    private String userId;

    @ApiModelProperty("用户名称")
    private String userName;

    @ApiModelProperty("密码")
    @JsonIgnoreProperties
    private String password;

    @ApiModelProperty("创建人")
    private String createUser;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("修改人")
    private String updateUser;

    @ApiModelProperty("修改时间")
    private LocalDateTime updateTime;
    @ApiModelProperty("用户角色")
    private ArrayList role;

    @ApiModelProperty("是否删除（0：正常/1：删除）")
    private Boolean isDeleted;
    @ApiModelProperty
    private String Authorization;

    public String getAuthorization() {
        return Authorization;
    }

    public void setAuthorization(String authorization) {
        Authorization = authorization;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", createUser='" + createUser + '\'' +
                ", createTime=" + createTime +
                ", updateUser='" + updateUser + '\'' +
                ", updateTime=" + updateTime +
                ", role=" + role +
                ", isDeleted=" + isDeleted +
                ", Authorization='" + Authorization + '\'' +
                '}';
    }

    public ArrayList getRole() {
        return role;
    }

    public void setRole(ArrayList role) {
        this.role = role;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }
    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }
    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }
    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }
    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

}
