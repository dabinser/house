package com.example.demo.ins.configer;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.User.entity.SysUser;
import com.example.demo.User.entity.UserRole;
import com.example.demo.User.service.IRoleService;
import com.example.demo.User.service.IUserRoleService;
import com.example.demo.User.service.IUserService;
import com.example.demo.dto.UserDto;
import com.example.demo.ins.configer.jwt.JwtSecurityConfigurer;
import com.example.demo.ins.configer.jwt.JwtTokenProvider;
import com.example.demo.tool.result.Result;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class webmvcconfige extends WebSecurityConfigurerAdapter  {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    JwtTokenProvider jwtTokenProvider;
    @Autowired
    private IUserService userService;
    @Autowired
    private IUserRoleService userRoleService;
    @Autowired
    private IRoleService roleService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //直接访问
        http.authorizeRequests()
                .antMatchers("/te/**","/swagger-ui/**","/actuator/**","/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                //登录接口
                .loginProcessingUrl("/login")
                .successHandler((request, response, authentication) -> {
                    response.setContentType("application/json;charset=utf-8");
                    SysUser user = userService.getOne(new QueryWrapper<SysUser>().eq("user_name", authentication.getName()));
                    List<UserRole> roleList = userRoleService.list(new QueryWrapper<UserRole>().eq("user_id", user.getUserId()));
                    ArrayList<String> idList = new ArrayList<>();
                    for (UserRole userRole : roleList) {
                        idList.add(userRole.getRoleId());
                    }
                    ArrayList<String> role =  roleService.findRoleById(idList);
                    String token = jwtTokenProvider.createToken(authentication.getName(),role);
                    UserDto userDto = new UserDto();
                    userDto.setRole(role);
                    BeanUtils.copyProperties(user,userDto);
                    Result details = Result.success(userDto);
                    response.getWriter().println(JSON.toJSON(details));
                    response.setHeader("Token",token);
                })
                .and()
                .authorizeRequests()
                .and()
                .apply(new JwtSecurityConfigurer(jwtTokenProvider))
//                //指定单个角色 hasrole 源码ROLE_角色
//                .antMatchers("/te").hasRole("role")
//
//                .antMatchers("/te").hasAuthority("admin")
//                //多个角色
//                .antMatchers("/te").hasAnyAuthority("ad")
                 ;//表单登录允许任意权限访问

        http.csrf().disable();//关闭默认的csrf认证;




    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(password());
    }

    @Bean
    PasswordEncoder password(){
        return new BCryptPasswordEncoder();
    }

    /*@Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/")
               // .allowCredentials(true)
                .allowedMethods("GET","POST","PUT","DELETE","HEAD");
    }*/
}
