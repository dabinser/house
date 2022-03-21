package com.example.demo.User.mapper;

import com.example.demo.User.entity.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 权限表 Mapper 接口
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Mapper

public interface PermissionMapper extends BaseMapper<Permission> {

}
