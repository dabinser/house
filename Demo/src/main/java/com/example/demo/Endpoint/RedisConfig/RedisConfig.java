package com.example.demo.Endpoint.RedisConfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;

/**
 * @description： redis监听配置类
 * @author：weirx
 * @date：2021/3/22 14:08
 * @version：3.0
 */
@Configuration
public class RedisConfig {

    /**
     * description: 手动注册Redis监听到IOC
     *
     * @param redisConnectionFactory
     * @return: org.springframework.data.redis.listener.RedisMessageListenerContainer
     * @author: jeffj
     * @time: 2021/3/22 14:11
     */
    @Bean
    public RedisMessageListenerContainer redisMessageListenerContainer(RedisConnectionFactory redisConnectionFactory) {
        RedisMessageListenerContainer container = new RedisMessageListenerContainer();
        container.setConnectionFactory(redisConnectionFactory);
        return container;
    }
}
