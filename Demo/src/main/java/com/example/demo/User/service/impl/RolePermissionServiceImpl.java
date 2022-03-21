package com.example.demo.User.service.impl;

import com.example.demo.User.entity.RolePermission;
import com.example.demo.User.mapper.RolePermissionMapper;
import com.example.demo.User.service.IRolePermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色权限关联表 服务实现类
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Service
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionMapper, RolePermission> implements IRolePermissionService {

}
