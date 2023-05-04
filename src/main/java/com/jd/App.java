package com.jd;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication //自动配置 + 扫描包
@MapperScan("com.jd.mapper")
public class App {
    public static void main(String[] args) {
        //使用启动类去启动一个Spring应用程序
        SpringApplication.run(App.class);
    }
}
