package com.example.demo.solve.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.demo.dto.SolveDto;
import com.example.demo.solve.entity.Solve;
import com.example.demo.solve.service.ISolveService;
import com.example.demo.tool.Baseseach.Basepage;
import com.example.demo.tool.Interface.MultiRequestBody;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author jiangfly
 * @since 2022-03-27
 */
@RestController
@RequestMapping("/solve")
public class SolveController {
    @Resource
    private ISolveService solveService;

    @PostMapping
    public Result findAll(@RequestBody Basepage basepage){
        Basepage page = solveService.page(basepage);
        return Result.success(page);
    }
    @DeleteMapping("/{id}")
    public Result deleteById(@PathVariable("id") int id){
        boolean b = solveService.removeById(id);
        return Result.success(b);
    }

    @PostMapping("/condition")
    public Result conditionQuery(@RequestBody SolveDto solveDto){
        Solve solve = solveDto.getSolve();
        Basepage basepage = solveDto.getBasepage();
        QueryWrapper<Solve> solveQueryWrapper = new QueryWrapper<>();
        if (null!=solve.getAddress()){
            solveQueryWrapper.like("address", solve.getAddress());
        }
        if (!solve.getName().equals("")&&null!=solve.getName()){
            solveQueryWrapper.eq("name", solve.getName().trim());
        }
        if (null!=solve.getStatus()){
            solveQueryWrapper.eq("status", solve.getStatus());
        }
        Basepage page = solveService.page(basepage, solveQueryWrapper);
        return Result.success(page);

    }
    @PatchMapping
    public Result upDate(@RequestBody @NotBlank Solve solve){

        boolean b = solveService.updateById(solve);
        return Result.success(b);
    }


}
