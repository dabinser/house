package com.example.demo.User.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 角色权限关联表
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@TableName("sys_role_permission")
@ApiModel(value = "RolePermission对象", description = "角色权限关联表")
public class RolePermission implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("角色ID")
    private String roleId;

    @ApiModelProperty("权限ID")
    private String permissionId;

    @ApiModelProperty("创建人")
    private String createUser;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("修改人")
    private String updateUser;

    @ApiModelProperty("修改时间")
    private LocalDateTime updateTime;

    @ApiModelProperty("是否删除（0：正常/1：删除）")
    private Boolean isDeleted;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
    public String getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(String permissionId) {
        this.permissionId = permissionId;
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

    @Override
    public String toString() {
        return "RolePermission{" +
            "id=" + id +
            ", roleId=" + roleId +
            ", permissionId=" + permissionId +
            ", createUser=" + createUser +
            ", createTime=" + createTime +
            ", updateUser=" + updateUser +
            ", updateTime=" + updateTime +
            ", isDeleted=" + isDeleted +
        "}";
    }
}
