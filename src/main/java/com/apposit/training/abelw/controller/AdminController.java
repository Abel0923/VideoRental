package com.apposit.training.abelw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @GetMapping("/admin_home")
    public String adminHome(){
        return "adminHome";
    }

    @GetMapping("/admin_add_videos")
    public String addVideos(){
        return "addVideo";
    }

    @GetMapping("/admin_list_customers")
    public String listCustomers(){
        return "listCustomers";
    }
    @GetMapping("/admin_list_rented")
    public String listRented(){
        return "listRented";
    }

}
