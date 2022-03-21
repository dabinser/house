package com.example.demo.ins.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.User.entity.Menu;
import com.example.demo.User.entity.SysUser;
import com.example.demo.User.service.IUserService;
import com.example.demo.ins.configer.MyUserDetailService;
import com.example.demo.ins.configer.jwt.JwtTokenProvider;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.security.Principal;

@RestController
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private MyUserDetailService myUserDetailService;
    @Autowired
    private JwtTokenProvider jwtTokenProvider;
    @Autowired
    private RentController rentController;
    @Autowired
    private IUserService userService;
    @GetMapping("/currentusername")
    public String currentUserName(Principal principal) {
        return principal.getName();
    }

    @PostMapping
    public Result<Menu> logon(@RequestBody SysUser user){
        UserDetails userDetails = myUserDetailService.loadUserByUsername(user.getUserName());
        userDetails.getUsername();
        return Result.success(new Menu());
    }
    @CrossOrigin
    @GetMapping("/success")
    public Result succss(HttpServletResponse httpServletResponse,Principal principal){

        String token = jwtTokenProvider.createToken(principal.getName(), null);
        httpServletResponse.setHeader("Authorization",token);
        SysUser user_name = userService.getOne(new QueryWrapper<SysUser>().eq("user_name", principal.getName()));

        return Result.success(user_name);
    }

}
