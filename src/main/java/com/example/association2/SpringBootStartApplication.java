package com.example.association2;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

//让该类继承springboot的SpringBootServletInitializer
public class SpringBootStartApplication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application){
        //找到原先的启动类
        return application.sources(Association2Application.class);
    }
}