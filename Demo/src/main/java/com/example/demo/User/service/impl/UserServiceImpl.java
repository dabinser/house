package com.example.demo.User.service.impl;

import com.example.demo.User.entity.SysUser;
import com.example.demo.User.mapper.UserMapper;
import com.example.demo.User.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, SysUser> implements IUserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public Result findRole(String name) {
        return null;
    }
}
