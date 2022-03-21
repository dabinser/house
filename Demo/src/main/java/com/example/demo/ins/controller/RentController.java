package com.example.demo.ins.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.User.entity.SysUser;
import com.example.demo.User.service.IUserService;
import com.example.demo.dto.SearchDto;
import com.example.demo.ins.entity.Collection;
import com.example.demo.ins.entity.Rent;
import com.example.demo.ins.service.ICollectionService;
import com.example.demo.ins.service.IRentService;
import com.example.demo.tool.Baseseach.Basepage;
import com.example.demo.tool.result.CodeMsg;
import com.example.demo.tool.result.Result;
import com.sun.istack.internal.NotNull;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author j
 * @since 2021-12-16
 */
@RestController

@RequestMapping("/te/rent")
public class RentController {
    @Autowired
    private IRentService rentService;
    @Autowired
    private IUserService userService;
    @Autowired
    private ICollectionService collectionService;

    @GetMapping("/{Id}")
    public Result get(@PathVariable int Id){
        Rent rent = rentService.getById(Id);
        return Result.success(rent);
    }
    @PostMapping("/page")
    public Result getPageRent( @RequestBody Basepage basepage){
        Basepage page = rentService.pages(basepage);
//        Basepage page = rentService.page(basepage);
        return Result.success(page);
    }

    /**
     * 新增租赁信息
     * @param rent
     * @param principal
     * @return
     */
    @PostMapping("/add")
    @ApiModelProperty
    public Result add(@RequestBody @NotNull Rent rent, Principal principal, HttpServletRequest httpServletRequest){
        if (null!=rent) {
            SysUser user = userService.getOne(new QueryWrapper<SysUser>().eq("user_name", principal.getName()));
            rent.setSysUserId(user.getId());
            Integer RentId = rentService.Save(rent);
            return Result.success(RentId);
        }
        else return Result.error("信息不完善");
    }

    /**
     * 修改
     * @param rent
     * @return
     */
    @PostMapping
    public Result amend(@RequestBody Rent rent){
        rentService.updateById(rent);
        Rent  amendRent= rentService.getById(rent.getId());
        return Result.success(amendRent);
    }
    @DeleteMapping("/{Id}")
    public  Result delet(@PathVariable int Id){
        rentService.removeById(Id);
        return Result.success("删除成功");
    }

    /**
     * 获取当前登录者发布的租赁信息
     * @param principal
     * @return
     */
    @GetMapping
    public Result ownRent(Principal principal){
        if (null!=principal.getName()){
            SysUser user = userService.getOne(new QueryWrapper<SysUser>().eq("user_name", principal.getName()));
            List<Rent> rentList = rentService.list(new QueryWrapper<Rent>().eq("sys_user_id", user.getId()));
            if (null!=rentList){
                return Result.success(rentList);
            }
            else {
                return Result.success("未查询到相关数据");
            }
        }
        else {
            return Result.error("未登录无法查询");
        }
    }

    /**
     * 条件分页查询
     * @param condition
     * @param basepage
     * @return
     */
    @PostMapping("/ConditionQuery")
    public Result condition(@RequestBody SearchDto searchDto){
/*        QueryWrapper<Rent> rentQueryWrapper = new QueryWrapper<>();
        if (null!=condition){
            if(null!=condition.getAddress()){
                rentQueryWrapper.like("area",condition.getAddress());
            }
            if (null!=condition.getMinPrice()){
                rentQueryWrapper.ge("pay",condition.getMinPrice());
            }
            if (null!=condition.getMaxPrice()){
                rentQueryWrapper.le("pay",condition.getMaxPrice());
            }
            if (null!=condition.getElevator()){
                rentQueryWrapper.eq("elevator",condition.getElevator().getCode());
            }
            if (null!=condition.getMode()){
                rentQueryWrapper.eq("mode",condition.getMode().getCode());
            }
            if (null!=condition.getOrientation()){
                rentQueryWrapper.eq("orientation",condition.getOrientation().getCode());
            }
            if(null!=condition.getStorey()){
                rentQueryWrapper.eq("storey",condition.getStorey().getCode());
            }
            rentQueryWrapper.inSql("id","select ")
            Basepage page = rentService.page(basepage, rentQueryWrapper);

            return Result.success(page);
        }
        else {
            Basepage page = rentService.pages(basepage);
            return Result.success(page);
        }*/
        Basepage basepage1 = rentService.pagesCondition(searchDto.getBasepage(), searchDto.getCondition());
        return Result.success(basepage1);
    }
    @GetMapping("/Collection")
    public Result findAttention(Principal principal) {
        if (null != principal) {
            SysUser user = userService.getOne(new QueryWrapper<SysUser>().eq("user_name", principal.getName()));
            List<Collection> list = collectionService.list(new QueryWrapper<Collection>().eq("user_id", user.getId()).select("ren_id"));
            ArrayList<Integer> arrayList = new ArrayList<>();
            for (Collection collection : list) {
                arrayList.add(collection.getRentId());
            }
            List<Rent> rents = rentService.listByIds(arrayList);
            return Result.success(rents);
        }
        else {
            return Result.error(CodeMsg.NOT_LOGIN);
        }

    }




}


