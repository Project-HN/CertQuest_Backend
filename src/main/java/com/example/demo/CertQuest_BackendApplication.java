package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.example.demo.mapper")
public class CertQuest_BackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(CertQuest_BackendApplication.class, args);
	}

}
