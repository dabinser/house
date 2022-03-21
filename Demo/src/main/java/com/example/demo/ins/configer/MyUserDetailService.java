package com.example.demo.ins.configer;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.User.entity.Role;
import com.example.demo.User.entity.SysUser;
import com.example.demo.User.mapper.UserRoleMapper;
import com.example.demo.User.service.IUserService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
@Log4j(topic = "userDetail")
public class MyUserDetailService implements UserDetailsService {
    @Autowired
    private IUserService userService;
    @Autowired
    private UserRoleMapper userRoleMapper;



    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        QueryWrapper<SysUser> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("user_name",username);
        SysUser user = userService.getOne(userQueryWrapper);
        if (user==null){
            throw new UsernameNotFoundException("用户名不存在");
        }
        List<Role> roles = userRoleMapper.findById(user.getId());
        List<GrantedAuthority> grantedAuthorities = AuthorityUtils.commaSeparatedStringToAuthorityList(roles.stream()
                .map(r -> r.getRoleName()).collect(Collectors.joining(",")));


        return new User(user.getUserName(), user.getPassword(), grantedAuthorities);


    }





}
