package com.example.demo.User.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.User.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Mapper

public interface UserMapper extends BaseMapper<SysUser> {
    String role(String username);
}
