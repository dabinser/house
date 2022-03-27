package com.example.demo.ins.configer;/**
 * @Author jeff
 * @Date 04/03/2022 13:48
 * @Version 1.0
 * @Description:
 */

import com.example.demo.tool.Interface.impl.MultiRequestBodyArgumentResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.charset.Charset;
import java.util.List;

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
    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        // 添加MultiRequestBody参数解析器
        argumentResolvers.add(new MultiRequestBodyArgumentResolver());
    }

    @Bean
    public HttpMessageConverter<String> responseBodyConverter() {
        // 解决中文乱码问题
        return new StringHttpMessageConverter(Charset.forName("UTF-8"));
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(responseBodyConverter());
    }

}
