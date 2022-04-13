package com.example.demo.ins.service.impl;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.demo.dto.Condition;
import com.example.demo.ins.entity.Rent;
import com.example.demo.ins.mapper.RentMapper;
import com.example.demo.ins.service.IRentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author j
 * @since 2021-12-16
 */
@Service
public class RentServiceImpl extends ServiceImpl<RentMapper, Rent> implements IRentService {
   /* @Override
    public <E extends IPage<Rent>> E page(E page) {

        return null;
    }*/
    @Autowired
    private RentMapper rentMapper;
     public Integer Save(Rent rent){
        return rentMapper.save(rent);
    }

    @Override
    public <E extends IPage<Rent>> E pages(E page) {
        IPage<Rent> rentIPage = rentMapper.selectPageVo(page, 1);

        return (E) rentIPage;
    }
    public <E extends IPage<Rent>> E pagesCondition(E page, Condition condition) {
        IPage<Rent> rentIPage = rentMapper.selectPageCondition(page, condition);

        return (E) rentIPage;
    }

    @Override
    public Rent findById(int id) {
        Rent rent = rentMapper.findById(id);
        return rent;
    }



/*    public <E extends IPage<Rent>> E Conditionpage(E page, QueryWrapper<Rent> queryWrapper) {

        IPage<Rent> rentIPage = rentMapper.selectPageVo(page, 1);
        return (E) rentIPage;
    }*/

    /*@Override
    public <E extends IPage<Rent>> E page(E page, Wrapper<Rent> queryWrapper) {
        return
    }*/
}
