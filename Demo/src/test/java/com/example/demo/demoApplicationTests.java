package com.example.demo;

/*import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import org.junit.jupiter.api.Test;*/
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Collections;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class demoApplicationTests {

	/*@Test
	void contextLoads() {
		FastAutoGenerator.create("jdbc:mysql://localhost:3306/test", "root", "root")
				.globalConfig(builder -> {
					builder.author("jiangfly") // 设置作者
							.enableSwagger() // 开启 swagger 模式
							.fileOverride() // 覆盖已生成文件
							.outputDir("C:\\Users\\fly\\Desktop\\毕设"); // 指定输出目录
				})
				.packageConfig(builder -> {
					builder.parent("com.example.demo")
							// 设置父包名
							.moduleName("solve") // 设置父包模块名
							.pathInfo(Collections.singletonMap(OutputFile.xml, "F:\\MYCODE\\remote\\Demo\\src\\main\\resources\\Mapper")); // 设置mapperXml生成路径
				})

				.strategyConfig(builder -> {
					builder.addInclude("solve") // 设置需要生成的表名
							.addTablePrefix("t_", "c_")
							.mapperBuilder().enableMapperAnnotation(); // 设置过滤表前缀
				})
				.templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
				.execute();

	}*/
//
//
//
//		int a[]={1,7,3,6,5,6};
//		int result=0;
//		boolean flag;
//		for (int i = 0; i < a.length; i++) {
//			if (i==0){
//				result+=a[i];
//				flag=0==result?true:false;
//			}
//		}
//	}

}
