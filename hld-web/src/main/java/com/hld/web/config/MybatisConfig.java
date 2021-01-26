package com.hld.web.config;

import org.springframework.context.annotation.Configuration;
import tk.mybatis.spring.annotation.MapperScan;

@MapperScan("com.hld.web.mapper")
@Configuration
public class MybatisConfig {
}
