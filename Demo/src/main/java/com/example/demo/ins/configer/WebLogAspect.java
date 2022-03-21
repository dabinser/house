package com.example.demo.ins.configer;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

@Aspect
@Component
public class WebLogAspect {
    private Logger logger = LoggerFactory.getLogger(getClass());

//定义execution表达式使用
    @Pointcut("execution(public * com.example.demo.ins.controller..*.*(..))"/*+"||execution(public * com.example.demo.Endpoint.controller..*.*(..))"*/)
    public void webLog(){}

    @Before("webLog()")
    public void doBefore(JoinPoint joinpoint){
//接收到请求，记录请求内容
        ServletRequestAttributes attributes=(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request=attributes.getRequest();//记录下请求内容
        logger.info("URL:"+request.getRequestURL().toString());
        logger.info("HTTP METHOD:"+request.getMethod());
        logger.info("IP:"+request.getRemoteAddr());
        logger.info("CLASS METHOD:"+joinpoint.getSignature().getDeclaringTypeName()+"."+joinpoint.getSignature().getName());
        logger.info("ARGS:"+ Arrays.toString(joinpoint.getArgs()));

    }

    @AfterReturning(returning="ret",pointcut="webLog()")
    public void doAfterReturning(Object ret) throws Throwable {
//处理完请求，返回内容
            logger.info("RESPONSE:"+ret);
}
}
