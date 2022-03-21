package com.example.demo.User.mapper;

import com.example.demo.User.entity.Role;
import com.example.demo.User.entity.UserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 * 用户角色关联表 Mapper 接口
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Mapper
public interface UserRoleMapper extends BaseMapper<UserRole> {
    List<Role> findById(Integer id);
}
