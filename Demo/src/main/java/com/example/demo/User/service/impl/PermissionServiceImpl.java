package com.example.demo.User.service.impl;

import com.example.demo.User.entity.Permission;
import com.example.demo.User.mapper.PermissionMapper;
import com.example.demo.User.service.IPermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 权限表 服务实现类
 * </p>
 *
 * @author jiangFly
 * @since 2022-01-21
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

}
