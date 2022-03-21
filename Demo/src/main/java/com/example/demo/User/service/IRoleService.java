package com.example.demo.User.service;

import com.example.demo.User.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.ArrayList;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
public interface IRoleService extends IService<Role> {
    ArrayList<String> findRoleById(ArrayList<String> id);
}
