package com.apposit.training.abelw;

import com.apposit.training.abelw.service.AdminService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        new File(AdminService.uploadDirectory).mkdir();
        SpringApplication.run(Application.class, args);
    }
}
