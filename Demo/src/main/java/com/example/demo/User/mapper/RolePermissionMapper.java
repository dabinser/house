package com.example.demo.User.mapper;

import com.example.demo.User.entity.RolePermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 角色权限关联表 Mapper 接口
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Mapper
public interface RolePermissionMapper extends BaseMapper<RolePermission> {

}
