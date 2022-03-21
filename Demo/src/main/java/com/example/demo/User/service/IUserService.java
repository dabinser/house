package com.example.demo.User.service;

import com.example.demo.User.entity.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.demo.tool.result.Result;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
public interface IUserService extends IService<SysUser> {
    Result findRole(String name);

}
