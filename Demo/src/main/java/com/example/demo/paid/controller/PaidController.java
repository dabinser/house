package com.example.demo.paid.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.ins.entity.Enum.Status;
import com.example.demo.paid.entity.Paid;
import com.example.demo.paid.service.IPaidService;
import com.example.demo.tool.Baseseach.Basepage;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author jiangFly
 * @since 2022-03-21
 */
@Controller
@RequestMapping("/paid")
public class PaidController {
    @Autowired
    private IPaidService paidService;
    @GetMapping
    public Result findAll(Basepage basepage){
        Basepage page = paidService.page(basepage);
        return Result.success(page);
    }
    @PostMapping
    public Result condition(@RequestBody @NotNull Status status, Basepage basepage){
        Basepage page = paidService.page(basepage, new QueryWrapper<Paid>().select("status", status.getValue()));
        return Result.success(page);

    }
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable("id") int id){
        return Result.success(paidService.removeById(id));
    }
    @PostMapping("/addPaid")
    public Result addPaid(@RequestBody @NotNull Paid paid){
        return Result.success(paidService.save(paid));
    }


}
