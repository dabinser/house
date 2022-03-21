package com.example.demo.User.service.impl;

import com.example.demo.User.entity.Role;
import com.example.demo.User.mapper.RoleMapper;
import com.example.demo.User.service.IRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public ArrayList<String> findRoleById(ArrayList<String> ids) {
        ArrayList<String> role = roleMapper.findRole(ids);
        return role;
    }
}
