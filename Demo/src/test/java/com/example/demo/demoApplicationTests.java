package com.example.demo;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class demoApplicationTests {

	@Test
	void contextLoads() {
	/*	FastAutoGenerator.create("url", "username", "password")
				.globalConfig(builder -> {
					builder.author("baomidou") // 设置作者
							.enableSwagger() // 开启 swagger 模式
							.fileOverride() // 覆盖已生成文件
							.outputDir("D://"); // 指定输出目录
				})
				.packageConfig(builder -> {
					builder.parent("com.baomidou.mybatisplus.samples.generator") // 设置父包名
							.moduleName("system") // 设置父包模块名
							.pathInfo(Collections.singletonMap(OutputFile.mapperXml, "D://")); // 设置mapperXml生成路径
				})
				.strategyConfig(builder -> {
					builder.addInclude("t_simple") // 设置需要生成的表名
							.addTablePrefix("t_", "c_"); // 设置过滤表前缀
				})
				.templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
				.execute();

	}

*/

		int a[]={1,7,3,6,5,6};
		int result=0;
		boolean flag;
		for (int i = 0; i < a.length; i++) {
			if (i==0){
				result+=a[i];
				flag=0==result?true:false;
			}
		}
	}

}
