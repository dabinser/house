package com.example.demo.User.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.User.entity.SysUser;
import com.example.demo.User.service.IUserService;
import com.example.demo.ins.entity.Rent;
import com.example.demo.ins.service.IRentService;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import java.security.Principal;
import java.util.List;

/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Controller
@RequestMapping("/User/menu")
public class MenuController {
    @Autowired
    private IRentService rentService;
    @Autowired
    private IUserService userService;
    @GetMapping
    public Result getMenu(Principal principal){
        SysUser user = userService.getOne(new QueryWrapper<SysUser>().eq("user_name", principal.getName()));
        QueryWrapper<Rent> rentQueryWrapper = new QueryWrapper<>();
        rentQueryWrapper.eq("sys_user_id",user.getId());
        List<Rent> rentList = rentService.list(rentQueryWrapper);
        return Result.success(rentList);
    }

}
