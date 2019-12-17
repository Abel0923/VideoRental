package com.apposit.training.abelw.controller;

import com.apposit.training.abelw.data.VideoData;
import com.apposit.training.abelw.model.VideoGenre;
import com.apposit.training.abelw.model.VideoType;
import com.apposit.training.abelw.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
;

@Controller
public class AdminController {
    @Autowired
    VideoService videoService;


    @GetMapping("/admin_home")
    public String adminHome(Model model){
        videoService.fetchData();
        model.addAttribute("noOfVideos", videoService.getVideos().size());
        return "adminHome";
    }

    @GetMapping("/admin_add_videos")
    public String addVideos(Model model){
        model.addAttribute("video", new VideoData());
        model.addAttribute("videoGenre", videoService.findAllGenre());
        model.addAttribute("videoType", videoService.findAllVideoType());
        return "addVideo";
    }

    @PostMapping("/add_video")
    public String saveVideo(Model model, @Valid VideoData videoData, BindingResult result){

        if (result.hasErrors()){
            model.addAttribute("video", new VideoData());
            model.addAttribute("videoGenre", videoService.findAllGenre());
            model.addAttribute("videoType", videoService.findAllVideoType());
            return "addVideo";
        }
        videoService.addVideos(videoData);
        return "redirect:/admin_list_videos";
    }

    @GetMapping("/admin_list_videos")
    public String listCustomers(Model model){
        model.addAttribute("videos", videoService.getVideos());
        return "listVideos";
    }
    @GetMapping("/admin_list_rented")
    public String listRented(){
        return "listRented";
    }

    @GetMapping("admin_add_type")
    public String addType(Model model){
        model.addAttribute("type", new VideoType());
        return "addType";
    }
    @GetMapping("admin_add_genre")
    public String addGenre(Model model){
        model.addAttribute("genre", new VideoGenre());
        return "addGenre";
    }

    @PostMapping("admin_add_type")
    public String saveType(Model model, @Valid VideoType videoType, BindingResult result){
        if (result.hasErrors()){
            return "addType";
        }
        videoService.saveType(videoType);
        return "redirect:/admin_home";
    }
    @PostMapping("admin_add_genre")
    public String saveGenre(Model model, @Valid VideoGenre videoGenre, BindingResult result){

        if (result.hasErrors()){
            return "addGenre";
        }
        videoService.saveGenre(videoGenre);
        return "redirect:/admin_home";
    }

    @GetMapping("delete_video/{id}")
    public String deleteVideo(@PathVariable("id") Long id){
        videoService.deleteVideo(id);
        return "redirect:/admin_home";
    }

//    private String getLoggedInUserName(Model model) {
//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//
//        if (principal instanceof UserDetails) {
//            return ((UserDetails) principal).getUsername();
//        }
//
//        return principal.toString();
//    }
}
