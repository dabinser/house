package com.example.demo.tool.Redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

@Component
public class RedisUtil {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;


    /**
     * 发布
     *
     * @param key
     */
    public void publish(String key, String value) {
        stringRedisTemplate.convertAndSend(key, value);
    }
}
