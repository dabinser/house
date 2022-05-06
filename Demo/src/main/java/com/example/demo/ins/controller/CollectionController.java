package com.example.demo.ins.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.ins.entity.Collection;
import com.example.demo.ins.service.ICollectionService;
import com.example.demo.ins.service.IRentService;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author jiangFly
 * @since 2022-02-15
 */
@RestController
@RequestMapping("/collection")
public class CollectionController {
    @Autowired
    private ICollectionService collectionService;
    @Autowired
    private IRentService rentService;
    @PostMapping
    public Result inreat(@RequestBody @NotNull Collection collection){

        return Result.success(collectionService.save(collection));
    }
    @DeleteMapping
    public Result delete(@RequestBody @NotNull Collection collection){
        collectionService.remove(new QueryWrapper<Collection>().eq(equals(collection.getUserId()),"user_id",collection.getUserId()));
        return Result.success(true);
    }
    @GetMapping("/{id}")
    public Result getCollection(@PathVariable("id") int id){
        QueryWrapper<Collection> collectionQueryWrapper = new QueryWrapper<>();
        collectionQueryWrapper.eq("user_id",id).select("rent_id");
        List<Collection> list = collectionService.list(collectionQueryWrapper);
        ArrayList  arrayList= new ArrayList();
        for (Collection collection : list) {
            arrayList.add(collection.getRentId());
        }
        List listRent = rentService.listByIds(arrayList);
        return Result.success(listRent);

    }
    @GetMapping
    public Result isCollect(@RequestBody Collection collection){
        return  null;
    }

}
