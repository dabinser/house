package com.example.demo.ins.service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.demo.dto.Condition;
import com.example.demo.ins.entity.Rent;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author j
 * @since 2021-12-16
 */
public interface IRentService extends IService<Rent> {
    Integer Save(Rent rent);
    <E extends IPage<Rent>> E pages(E page);
    <E extends IPage<Rent>> E pagesCondition(E page, Condition condition);
    Rent findById(int id);

}
