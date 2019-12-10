package com.apposit.training.abelw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class HomeController {

    @GetMapping("/")
    public String homePage(){
        return "home";
    }

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @GetMapping("/video/{id}")
    public String video(@PathVariable("id") long id){
        return "home";
    }

}
