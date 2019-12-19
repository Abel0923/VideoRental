package com.apposit.training.abelw.controller;

import com.apposit.training.abelw.data.VideoByTypeDto;
import com.apposit.training.abelw.data.VideoData;
import com.apposit.training.abelw.model.Video;
import com.apposit.training.abelw.model.VideoGenre;
import com.apposit.training.abelw.model.VideoType;
import com.apposit.training.abelw.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {


    @Autowired
    AdminService adminService;


    @GetMapping("/admin_home")
    public String adminHome(Model model) {
        adminService.fetchData();
        model.addAttribute("noOfVideos", adminService.getVideos().size());
        model.addAttribute("videos", adminService.getVideos());

        return "adminHome";
    }

    @GetMapping("/admin_add_videos")
    public String addVideos(Model model) {
        model.addAttribute("video", new VideoData());
        model.addAttribute("videoGenre", adminService.findAllGenre());
        model.addAttribute("videoType", adminService.findAllVideoType());
        return "addVideo";
    }

    @PostMapping("/add_video")
    public String saveVideo(@ModelAttribute("video") @Valid VideoData videoData,
                            @RequestParam("file") MultipartFile file,
                            BindingResult result,
                            Model model) {

        if (result.hasErrors() && file.getSize() > 2000) {
            return "addVideo";
        }

        adminService.addVideos(videoData, file);
        return "redirect:/admin/admin_list_videos";
    }

    // ---------------------------   Control on rented videos ----------------------- //
    @GetMapping("/admin_list_rented")
    public String listRented() {
        return "listRented";
    }

    // ---------------------------   Control on type or category ----------------------- //
    @GetMapping("admin_add_type")
    public String addType(Model model) {
        model.addAttribute("type", new VideoType());
        return "addType";
    }

    @PostMapping("admin_add_type")
    public String saveType(@ModelAttribute("type") @Valid VideoType videoType, BindingResult result,Model model) {
        if (result.hasErrors()) {
            return "addType";
        }
        adminService.saveType(videoType);
        return "redirect:/admin/admin_home";
    }


    // ---------------------------   Control on genre ----------------------- //
    @GetMapping("admin_add_genre")
    public String addGenre(Model model) {
        model.addAttribute("genre", new VideoGenre());
        return "addGenre";
    }

    @PostMapping("admin_add_genre")
    public String saveGenre(@ModelAttribute("genre") @Valid VideoGenre videoGenre, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return "addGenre";
        }
        adminService.saveGenre(videoGenre);
        return "redirect:/admin/admin_home";
    }

    // ---------------------------   Control delete Video ---------------------------- //
    @GetMapping("delete_video/{id}")
    public String deleteVideo(@PathVariable("id") Long id) {
        adminService.deleteVideo(id);
        return "redirect:/admin/admin_list_rented";
    }

    // ---------------------------   Control edit Video ---------------------------- //
    @GetMapping("edit_video/{id}")
    public String editVideo(@PathVariable("id") Long id, Model model) {
        model.addAttribute("selectedVideo", adminService.findVideoById(id));
        return "updateVideo";
    }

    @PostMapping("admin_update_video/{id}")
    public String saveEditedVideo(@ModelAttribute("selectedVideo") @Valid Video video) {
        adminService.saveEditedVideo(video);
        return "redirect:/admin/admin_home";
    }

}
