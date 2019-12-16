package com.apposit.training.abelw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/home")
    public String adminHome(){
        return "homeAdmin";
    }

    @GetMapping("/addVideo")
    public String addVideo(){
        return "addVideo";
    }
    @GetMapping("/list/customers")
    public String listCustomers(){
        return "listCustomers";
    }
    @GetMapping("/list/rented")
    public String listRented(){
        return "listRented";
    }
}
