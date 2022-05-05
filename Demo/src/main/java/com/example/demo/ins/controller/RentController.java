package com.example.demo.ins.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.example.demo.User.entity.SysUser;
import com.example.demo.User.service.IUserService;
import com.example.demo.dto.SearchDto;
import com.example.demo.ins.entity.Collection;
import com.example.demo.ins.entity.Enum.Status;
import com.example.demo.ins.entity.Rent;
import com.example.demo.ins.service.ICollectionService;
import com.example.demo.ins.service.IRentService;
import com.example.demo.tool.Baseseach.Basepage;
import com.example.demo.tool.result.CodeMsg;
import com.example.demo.tool.result.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
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
        Rent rent = rentService.findById(Id);
        return Result.success(rent);
    }
    @PostMapping("/page")
    public Result getPageRent( @RequestBody Basepage basepage){
        Basepage page = rentService.pages(basepage);
//        Basepage page = rentService.page(basepage);
        return Result.success(page);
    }
    @PostMapping("/pageQuery/{order}")
    public Result query(@RequestBody Basepage basepage,@PathVariable("order") String order){
//        QueryWrapper<Rent> rentQueryWrapper = new QueryWrapper<>();
//       rentQueryWrapper.inSql("url","select url from documentfile where rent_id=#{id}");
//        rentQueryWrapper.orderByDesc(basepage.getSort());
//        Basepage page = rentService.page(basepage, rentQueryWrapper);
//        return Result.success(page);
        basepage.addOrder(OrderItem.desc(order));
        QueryWrapper<Rent> rentQueryWrapper = new QueryWrapper<>();
        rentQueryWrapper.orderByDesc(order);
        rentService.page(basepage,rentQueryWrapper);
        return Result.success(order);
    }

    /**
     * 新增租赁信息
     * @param rent
     * @param principal
     * @return
     */
    @PostMapping("/addHouse")
    public Result add(@RequestBody @NotNull Rent rent, Principal principal){
        if (null!=rent) {
            SysUser user = userService.getOne(new QueryWrapper<SysUser>().eq("user_name", principal.getName()));
            rent.setSysUserId(user.getId());
            rent.setVname(principal.getName());
            rent.setRcode("666");
            rent.setDate(new Date());
            rent.setIs_rent(Status.No_Rent);
            rentService.Save(rent);
            return Result.success(rent.getId());
        }
        else return Result.error(CodeMsg.DATA_ERROR);
    }

    /**
     * 修改
     * @param rent
     * @return
     */
    @PostMapping
    public Result amend(@RequestBody Rent rent){
        boolean b = rentService.updateById(rent);
        return Result.success(b);
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
     * @param searchDto
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
        if (null==searchDto.getCondition()){
            Result pageRent = this.getPageRent(searchDto.getBasepage());
            return pageRent;
        }
        else {
            String sort = searchDto.getBasepage().getSort();
            searchDto.getBasepage().addOrder(OrderItem.asc(sort));
            Basepage basepage1 = rentService.pagesCondition(searchDto.getBasepage(), searchDto.getCondition());

            return Result.success(basepage1);
        }
    }
    @GetMapping("/Collection")
    public Result findAttention(Principal principal) {
        if (null != principal) {
            SysUser user = userService.getOne(new QueryWrapper<SysUser>().eq("user_name", principal.getName()));
            List<Collection> list = collectionService.list(new QueryWrapper<Collection>().eq("user_id", user.getId()));
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

    @PostMapping("/getExamine")
    public Result examine(@RequestBody Basepage basepage){
        QueryWrapper<Rent> rentQueryWrapper = new QueryWrapper<>();
        rentQueryWrapper.eq("is_show",0);
        Basepage page = rentService.page(basepage, rentQueryWrapper);
        return Result.success(page);

    }
    @PostMapping("/changeState/{id}/{state}")
    public Result state(@PathVariable("state") int state,@PathVariable("id") int id){

        rentService.changeState(id,state);
        return Result.success(CodeMsg.SUCCESS);
    }




}


