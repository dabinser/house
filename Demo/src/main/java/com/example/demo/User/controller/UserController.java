package com.example.demo.User.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.demo.User.entity.SysUser;
import com.example.demo.User.entity.UserRole;
import com.example.demo.User.service.IRoleService;
import com.example.demo.User.service.IUserRoleService;
import com.example.demo.User.service.IUserService;
import com.example.demo.dto.ModifyPasswordDto;
import com.example.demo.dto.UserDto;
import com.example.demo.tool.result.Result;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@RestController
@RequestMapping("/User/user")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IUserRoleService userRoleService;

    @PostMapping("/addition")
    public Result addUser(@RequestBody SysUser user){
        if (userService.count(new QueryWrapper<SysUser>().eq("user_name", user.getUserName()))>0){
            return Result.error("用户名重复");
        }
        else {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            return Result.success(userService.save(user));
        }
    }
    @PostMapping("/modify")
    public Result modify(@RequestBody ModifyPasswordDto user, Principal principal){
        UpdateWrapper<SysUser> sysUserUpdateWrapper = new UpdateWrapper<>();
        sysUserUpdateWrapper.eq("user_name",principal.getName());
        SysUser oldUser = userService.getOne(sysUserUpdateWrapper);
        if (passwordEncoder.matches(user.getOldPassword(),passwordEncoder.encode(oldUser.getPassword()))){
            userService.update(new UpdateWrapper<SysUser>().eq("user_name",principal.getName()).set("password",passwordEncoder.encode(user.getNewPassword())));
            return Result.success(true);
        }
        else return Result.error("修改密码失败");
    }
    @DeleteMapping("/{id}")
    public Result delete(Integer id){
        UpdateWrapper<SysUser> sysUserUpdateWrapper = new UpdateWrapper<>();
        sysUserUpdateWrapper.eq("id",id).set("is_deleted",1);
        userService.update(sysUserUpdateWrapper);
        return Result.success(true);
    }
    @GetMapping("/detail")
    public Result detail(@NotNull Principal principal){
        SysUser user = userService.getOne(new QueryWrapper<SysUser>().eq("user_name", principal.getName()));
        List<UserRole> roleList = userRoleService.list(new QueryWrapper<UserRole>().eq("user_id", user.getUserId()));
        ArrayList<String> idList = new ArrayList<>();
        for (UserRole userRole : roleList) {
            idList.add(userRole.getRoleId());
        }
        ArrayList<String> role =  roleService.findRoleById(idList);
        UserDto userDetail = new UserDto();
        userDetail.setRole(role);
        BeanUtils.copyProperties(user,userDetail);
        return Result.success(userDetail);
    }

}
