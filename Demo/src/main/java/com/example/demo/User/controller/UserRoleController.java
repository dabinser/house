package com.example.demo.User.controller;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.demo.User.entity.UserRole;
import com.example.demo.User.service.IUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

/**
 * <p>
 * 用户角色关联表 前端控制器
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@RestController
@RequestMapping("/User/user-role")
public class UserRoleController {
    @Autowired
    private IUserRoleService iUserRoleService;
    @Async
    public void addRole(HashMap hashMap){

    }

}
