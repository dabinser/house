//package com.example.demo.tool.Interface;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import springfox.documentation.builders.ApiInfoBuilder;
//import springfox.documentation.builders.PathSelectors;
//import springfox.documentation.builders.RequestHandlerSelectors;
//import springfox.documentation.service.Contact;
//import springfox.documentation.spi.DocumentationType;
//import springfox.documentation.spring.web.plugins.Docket;
//
//@Configuration
//public class SwaggerUtil {
//    @Bean
//    public Docket createRestApi(){
//        return new Docket(DocumentationType.SWAGGER_2)
//                .pathMapping("/")
//                .select()
//                .apis(RequestHandlerSelectors.basePackage("com/example/demo/ins/controller"))
//                .paths(PathSelectors.any())
//                .build()
//                .apiInfo(new ApiInfoBuilder()
//                .title("医疗系统")
//                        .description("用于管理患者信息的医疗系统平台")
//                        .version("1.0")
//                        .contact(new Contact("吕小白","https:www.baidu.com","****@qq.com")
//                        )
//                        .license("The Apache License")
//                        .licenseUrl("https:www.baidu.com")
//                        .build());
//    }
//}

