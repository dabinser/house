package com.example.demo.ins.configer.jwt;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "pkslow.jwt")
public class JwtProperties {
    private String secretKey = "pkslow.key";
    private long validityInMs = 3600_000;

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public long getValidityInMs() {
        return validityInMs;
    }

    public void setValidityInMs(long validityInMs) {
        this.validityInMs = validityInMs;
    }
}
