package com.example.demo.ins.configer;

import org.bouncycastle.asn1.pkcs.RSAPrivateKey;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.jwt.JwtHelper;
import org.springframework.security.jwt.crypto.sign.RsaSigner;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyStore;
import java.security.PublicKey;
import java.security.interfaces.RSAPrivateCrtKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.Map;
import java.util.Set;

public class KeyPairFactory {
    private KeyStore store;
    private final Object lock = new Object();
    /**
     * 获取公私钥.
     *
     * @param keyPath jks 文件在 resources 下的classpath
     * @param keyAlias keytool 生成的 -alias 值 felordcn
     * @param keyPass keytool 生成的 -storepass 值 123456
     * @return the key pair 公私钥对
     */
    KeyPair create(String keyPath, String keyAlias, String keyPass) {
        ClassPathResource resource = new ClassPathResource(keyPath);
        char[] pem = keyPass.toCharArray();
        try {
            synchronized (lock) {
                if (store == null) {
                    synchronized (lock) {
                        store = KeyStore.getInstance("jks");
                        store.load(resource.getInputStream(), pem);
                    }
                }
            }
        RSAPrivateCrtKey key = (RSAPrivateCrtKey) store.getKey(keyAlias, pem);
        RSAPublicKeySpec spec = new RSAPublicKeySpec(key.getModulus(), key.getPublicExponent());
        PublicKey publicKey = KeyFactory.getInstance("RSA").generatePublic(spec);
        return new KeyPair(publicKey, key);
    } catch (Exception e) {
        throw new IllegalStateException("Cannot load keys from store: " + resource, e);
    }
}
//    private String jwtToken(String aud, int exp, Set<String> roles, Map<String, String> additional) {
//        String payload = JwtPayLoad
//                .iss(jwtProperties.getIss())
//                .sub(jwtProperties.getSub())
//                .aud(aud)
//                .additional(additional)
//                .roles(roles)
//                .expDays(exp)
//                .builder();
//        RSAPrivateKey privateKey = (RSAPrivateKey)keyPair.getPrivate();
//        RsaSigner signer = new RsaSigner((java.security.interfaces.RSAPrivateKey) privateKey);
//        return JwtHelper.encode(payload, signer).getEncoded();
//    }
}
