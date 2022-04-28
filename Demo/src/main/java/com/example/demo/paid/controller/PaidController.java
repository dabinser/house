package com.example.demo.paid.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.dto.paidCondition;
import com.example.demo.paid.entity.Paid;
import com.example.demo.paid.service.IPaidService;
import com.example.demo.tool.Baseseach.Basepage;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author jiangFly
 * @since 2022-03-21
 */
@RestController
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
    public Result condition(@RequestBody @NotNull paidCondition paidCondition){
        Basepage page = paidService.page(paidCondition.getBasepage(), new QueryWrapper<Paid>().eq("status",paidCondition.getStatus()));
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
    @GetMapping("/{id}")
    public Result findById(@PathVariable("id") @NotNull String id){
        QueryWrapper<Paid> paidQueryWrapper = new QueryWrapper<>();
        paidQueryWrapper.eq("house_id",id);
        paidQueryWrapper.select("id","name");
        List<Map<String, Object>> maps = paidService.listMaps(paidQueryWrapper);

        return Result.success(maps);
    }



}
