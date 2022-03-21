package com.example.demo.ins.configer;/**
 * @Author jeff
 * @Date 04/03/2022 13:48
 * @Version 1.0
 * @Description:
 */

import org.springframework.context.annotation.Configuration;



import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 *@ClassName WebConfig
 *@Author jeffjliu
 *@Date 04/03/2022 13:48
 **/
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/")
                .allowedMethods("GET","POST","DELETE","PUT","HEAD");
    }
}
