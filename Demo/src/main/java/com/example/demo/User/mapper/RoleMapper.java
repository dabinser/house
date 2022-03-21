package com.example.demo.User.mapper;

import com.example.demo.User.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

/**
 * <p>
 * 角色表 Mapper 接口
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Mapper
public interface RoleMapper extends BaseMapper<Role> {

    ArrayList<String> findRole(ArrayList<String> ids);
}
