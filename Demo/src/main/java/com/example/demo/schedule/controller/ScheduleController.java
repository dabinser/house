package com.example.demo.schedule.controller;

import com.example.demo.schedule.entity.Schedule;
import com.example.demo.schedule.service.IScheduleService;
import com.example.demo.tool.Baseseach.Basepage;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author jiangfly
 * @since 2022-03-27
 */
@RestController
@RequestMapping("/schedule")
public class ScheduleController {

    @Autowired
    private IScheduleService scheduleService;

    @PostMapping
    public Result getSchedule(@RequestBody Basepage basepage){
        Basepage page = scheduleService.page(basepage);
        return Result.success(page);
    }
    @DeleteMapping("/{id}")
    public Result deletSchedule(@PathVariable("id") int id){
        boolean b = scheduleService.removeById(id);
        return Result.success(b);
    }
    @PostMapping("/addSchedule")
    public Result addSchedule(@RequestBody @NotNull Schedule schedule){
        schedule.setDate(new Date());
        boolean save = scheduleService.save(schedule);
        return Result.success(save);
    }
    @PatchMapping
    public Result modify(@RequestBody @NotBlank Schedule schedule){
        boolean b = scheduleService.updateById(schedule);
        return Result.success(b);
    }

}
