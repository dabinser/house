package com.example.demo.User.service.impl;

import com.example.demo.User.entity.UserRole;
import com.example.demo.User.mapper.UserRoleMapper;
import com.example.demo.User.service.IUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户角色关联表 服务实现类
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

}
