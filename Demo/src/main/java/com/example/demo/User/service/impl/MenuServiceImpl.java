package com.example.demo.User.service.impl;

import com.example.demo.User.entity.Menu;
import com.example.demo.User.mapper.MenuMapper;
import com.example.demo.User.service.IMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

}
