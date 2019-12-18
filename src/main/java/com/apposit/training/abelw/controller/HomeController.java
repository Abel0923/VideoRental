package com.apposit.training.abelw.controller;

import com.apposit.training.abelw.data.VideoByTypeDto;
import com.apposit.training.abelw.service.VideoService;
import com.apposit.training.abelw.utils.CalculatePrice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class HomeController {

    List<VideoByTypeDto> cart;
    @Autowired
    VideoService videoService;


    @GetMapping("/")
    public String homePage(Model model){
        videoService.fetchData();
        return "redirect:/user/home";
    }

    @GetMapping("/home")
    public String redirector(Model model, HttpSession session){

        model.addAttribute("videos", videoService.getVideos());
        model.addAttribute("genre", videoService.findAllGenre());

        @SuppressWarnings("unchecked")
        List<VideoByTypeDto> cart = (List<VideoByTypeDto>) session.getAttribute("MY_CART");

        if (cart == null) {
            cart = new ArrayList<>();
        }
        model.addAttribute("sessionMessages", cart);

        return "home";
    }
    @GetMapping("/genre/{type}")
    public String video(@PathVariable("type") long genre, Model model){
        videoService.fetchDataByGenre(genre);
        return "redirect:/user/home";
    }

    @GetMapping("/cart/{id}")
    public String addToCart(@PathVariable("id") int id, Model model, HttpSession session, HttpServletRequest request){
         cart  = (List<VideoByTypeDto>) session.getAttribute("MY_CART");
        if (cart == null) {
            cart = new ArrayList<>();
            request.getSession().setAttribute("MY_CART", cart);
        }

        cart.addAll(videoService.findVideoById(id));
        request.getSession().setAttribute("MY_CART", cart);
        return "redirect:/user/home";
    }

    @GetMapping("/cart")
    public String getCart(Model model, HttpServletRequest request){
        if (cart!=null)
        model.addAttribute("total_price", new CalculatePrice().calculatedPrice(cart));
        model.addAttribute("genre", videoService.findAllGenre());
        request.getSession().getAttribute("MY_CART");
        return "cart";
    }

    @GetMapping("/cart/delete/{id}")
    public String deleteItemFromCart(@PathVariable("id") int id){
        cart.removeIf(x -> x.getVideoId()==id);
        return "redirect:/user/cart";
    }

}