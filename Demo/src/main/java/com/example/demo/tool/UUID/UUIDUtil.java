package com.example.demo.tool.UUID;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @author : chpyue@foxmail.com
 * @date :2018/11/5 6:59
 * @Description: UUID 工具类
 */
@Component
public class UUIDUtil {
    /**
     * 获取一个UUID值
     * @return UUID值[String]
     */
    @Bean
    public  String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

    /**
     * 获取多个UUID值
     * @param number 所需个数
     * @return UUID集合
     */
    public  List<String> getUUID(Integer number){
        List<String> list = new ArrayList<>();
        while (0 <= (number--)){
            list.add(getUUID());
        }
        return list;
    }
}
