package com.example.demo.User.controller;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.demo.User.entity.Role;
import com.example.demo.User.service.IRoleService;
import com.example.demo.tool.result.CodeMsg;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@RestController
@RequestMapping("/User/role")
public class RoleController {
    @Autowired
    private IRoleService roleService;

    @PostMapping("/modify")
    public Result modifyRole(@RequestBody Role role){
        roleService.updateById(role);
        return Result.success(CodeMsg.SUCCESS);
    }
    @DeleteMapping("/{id}")
    public Result deletRole(@PathVariable("id") int id){
        roleService.update(new UpdateWrapper<Role>().eq("id",id).set("is_deleted","1"));
        return Result.success(CodeMsg.SUCCESS);
    }
    @PostMapping
    public Result append(@RequestBody @NotNull Role role){
        roleService.save(role);
        return Result.success(CodeMsg.SUCCESS);
    }
}
