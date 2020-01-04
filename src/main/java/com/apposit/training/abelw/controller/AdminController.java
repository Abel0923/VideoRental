package com.apposit.training.abelw.controller;

import com.apposit.training.abelw.data.VideoData;
import com.apposit.training.abelw.model.Video;
import com.apposit.training.abelw.model.VideoGenre;
import com.apposit.training.abelw.model.VideoType;
import com.apposit.training.abelw.service.AdminService;
import com.apposit.training.abelw.service.GoogleServiceHandler;
import com.apposit.training.abelw.service.UserService;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.util.store.FileDataStoreFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.validation.Valid;
import java.io.InputStreamReader;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @Autowired
    UserService userService;

    @Autowired
    GoogleServiceHandler googleServiceHandler;

    @PostConstruct
    public void init() throws Exception{
        GoogleClientSecrets secrets = GoogleClientSecrets.load(GoogleServiceHandler.JSON_FACTORY,
                new InputStreamReader(googleServiceHandler.gdSecretKeys.getInputStream()));
        googleServiceHandler.flow = new GoogleAuthorizationCodeFlow.Builder(GoogleServiceHandler.HTTP_TRANSPORT,
                GoogleServiceHandler.JSON_FACTORY,
                secrets,
                GoogleServiceHandler.SCOPES)
                .setDataStoreFactory(new FileDataStoreFactory(googleServiceHandler.credentialsFolder.getFile())).build();

        adminService.fetchData();
    }

    @GetMapping("/admin_home")
    public String adminHome(Model model) {

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

        //and i do have some validation on file size on application.properties file
        if (result.hasErrors()) {
            return "addVideo";
        }

        adminService.addVideos(videoData, file);
        return "redirect:/admin/admin_home";
    }

    // ---------------------------   Control on rented videos ----------------------- //
    @GetMapping("/admin_list_rented")
    public String listRented(Model model) {
        model.addAttribute("rented", adminService.getRentedVideos());
        return "listRented";
    }

    // ---------------------------   Control on type or category ----------------------- //
    @GetMapping("admin_add_type")
    public String addType(Model model) {
        model.addAttribute("type", new VideoType());
        model.addAttribute("listType", userService.getAllType());
        return "addType";
    }

    @PostMapping("admin_add_type")
    public String saveType(@ModelAttribute("type") @Valid VideoType videoType, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "addType";
        }
        adminService.saveType(videoType);
        return "redirect:/admin/admin_home";
    }

    @GetMapping("admin_remove_type/{id}")
    public String removeType(@PathVariable("id") Long id) {
        adminService.deleteType(id);
        return "redirect:/admin/admin_add_type";
    }

    // ---------------------------   Control on genre ----------------------- //
    @GetMapping("admin_add_genre")
    public String addGenre(Model model) {
        model.addAttribute("genre", new VideoGenre());
        model.addAttribute("listGenre", userService.getAllGenre());
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

    @GetMapping("admin_remove_genre/{id}")
    public String removeGenre(@PathVariable("id") Long id) {
        adminService.deleteGenre(id);
        return "redirect:/admin/admin_add_genre";
    }

    // ---------------------------   Control delete Video ---------------------------- //
    @GetMapping("delete_video/{id}")
    public String deleteVideo(@PathVariable("id") Long id) {
        adminService.deleteVideo(id);
        return "redirect:/admin/admin_home";
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
