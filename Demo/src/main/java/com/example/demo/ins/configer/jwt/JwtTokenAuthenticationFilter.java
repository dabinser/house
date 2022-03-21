package com.example.demo.ins.configer.jwt;

import com.example.demo.ins.configer.Exception.InvalidJwtAuthenticationException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Component
@Slf4j
public class JwtTokenAuthenticationFilter extends GenericFilterBean {

    private JwtTokenProvider jwtTokenProvider;

    public JwtTokenAuthenticationFilter(JwtTokenProvider jwtTokenProvider) {
        this.jwtTokenProvider = jwtTokenProvider;
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        try {
            String token = jwtTokenProvider.resolveToken(request);
            if (token != null && jwtTokenProvider.validateToken(token)) {
                Authentication auth = jwtTokenProvider.getAuthentication(token);

                if (auth != null) {
                    SecurityContextHolder.getContext().setAuthentication(auth);
                }
            }
        } catch (InvalidJwtAuthenticationException e) {
            response.setStatus(HttpStatus.UNAUTHORIZED.value());
            response.getWriter().write("Invalid token");
            response.getWriter().flush();
            return;
        }

        filterChain.doFilter(req, res);
    }
    /**
     * 处理登录成功后返回 JWT Token 对.
     *
     *
     * @return the authentication success handler
     */
    @Bean
    public AuthenticationSuccessHandler authenticationSuccessHandler() {
        return (request, response, authentication) -> {
            if (response.isCommitted()) {
                log.debug("Response has already been committed");
                return;
            }
            Map<String, Object> map = new HashMap<>(5);
            map.put("time", LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            map.put("flag", "success_login");
            User principal = (User) authentication.getPrincipal();

            String username = principal.getUsername();
            Collection<GrantedAuthority> authorities = principal.getAuthorities();
            ArrayList roles = new ArrayList<String>();
            if (CollectionUtils.isNotEmpty(authorities)) {
                for (GrantedAuthority authority : authorities) {
                    String roleName = authority.getAuthority();
                    roles.add(roleName);
                }
            }
            String token = jwtTokenProvider.createToken(username, roles);
            map.put("access_token",token);
            map.put("refresh_token",jwtTokenProvider.jwtProperties);

            // JwtTokenPair jwtTokenPair = jwtTokenGenerator.jwtTokenPair(username, roles, null);

           // map.put("access_token", jwtTokenPair.getAccessToken());
         //   map.put("refresh_token", jwtTokenPair.getRefreshToken());

          //  ResponseUtil.responseJsonWriter(response, RestBody.okData(map, "登录成功"));
        };
    }

}
