/*
package com.example.demo.ins.configer;*/
/**
 * @Author jeff
 * @Date 09/03/2022 16:13
 * @Version 1.0
 * @Description:
 *//*


import com.example.demo.User.service.IUserService;
import com.example.demo.ins.configer.jwt.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

*/
/**
 *@ClassName Handle
 *@Author jeffjliu
 *@Date 09/03/2022 16:13
 **//*

@Component
public class Handle implements AuthenticationSuccessHandler {
    @Autowired
    private JwtTokenProvider jwtTokenProvider;
    @Autowired
    private IUserService userService;
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

    }
}
*/
