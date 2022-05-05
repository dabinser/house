package com.example.demo.ins.mapper;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.demo.dto.Condition;
import com.example.demo.ins.entity.Rent;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author j
 * @since 2021-12-16
 */
@Mapper
public interface RentMapper extends BaseMapper<Rent> {
//    IPage<Rent> selectPageVo(IPage<?> page, Integer state);
//
    int save(Rent rent);
    IPage<Rent> selectPageVo(IPage<?> page, Integer state);
    IPage<Rent> selectPageCondition( IPage<?> page,Condition condition);
    // 条件分页查询
    IPage<Rent> pageOrder(IPage<Rent> page, Wrapper<Rent> queryWrapper);


    Rent findById(int id);

    void state(int id, int state);
}
