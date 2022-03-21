package com.example.demo.ins.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.ins.entity.Collection;
import com.example.demo.ins.service.ICollectionService;
import com.example.demo.tool.result.Result;
import com.sun.istack.internal.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author jiangFly
 * @since 2022-02-15
 */
@RestController
@RequestMapping("/ins/collection")
public class CollectionController {
    @Autowired
    private ICollectionService collectionService;
    @PostMapping
    public Result inreat(@RequestBody @NotNull Collection collection){

        return Result.success(collectionService.save(collection));
    }
    @DeleteMapping
    public Result delete(@RequestBody @NotNull Collection collection){
        collectionService.remove(new QueryWrapper<Collection>().eq(equals(collection.getUserId()),"user_id",collection.getUserId()));
        return Result.success(true);
    }

}
