package com.apposit.training.abelw.controller;

import com.apposit.training.abelw.model.Video;
import com.apposit.training.abelw.service.GoogleServiceHandler;
import com.apposit.training.abelw.service.UserService;
import com.apposit.training.abelw.utils.CalculatePrice;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.FileList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping(value = "/user")
public class HomeController {

    List<Video> cart;
    @Autowired
    UserService userService;

    @Autowired
    GoogleServiceHandler googleServiceHandler;

    @PostConstruct
    public void init() throws Exception{
        userService.fetchData();
    }

    @GetMapping("/")
    public String home()  {
        return "redirect:/user/home";
    }

    @GetMapping("/home")
    public String redirector(Model model, HttpSession session) throws IOException {

        model.addAttribute("videos", userService.getVideos());
        model.addAttribute("genre", userService.getAllGenre());
        model.addAttribute("type", userService.getAllType());
        model.addAttribute("cart", cart);

        @SuppressWarnings("unchecked")
        List<Video> cart = (List<Video>) session.getAttribute("MY_CART");

        if (cart == null) {
            cart = new ArrayList<>();
        }
        model.addAttribute("sessionMessages", cart);

        return "home";
    }


    @GetMapping("/genre/{genre}")
    public String videoByGenre(@PathVariable("genre") long genre, Model model){
        userService.fetchDataByGenre(genre);
        return "redirect:/user/home";
    }

    @GetMapping("/type/{type}")
    public String videoByType(@PathVariable("type") int type, Model model){
        userService.getDataByType(type);
        return "redirect:/user/home";
    }

    @GetMapping("/cart/{id}/{days}")
    public String addToCart(@PathVariable("id") int id, @PathVariable("days") int days,
                            Model model, HttpSession session, HttpServletRequest request){
        System.out.println("CAAAAAAAAAA : " + days);
         cart  = (List<Video>) session.getAttribute("MY_CART");
        if (cart == null) {
            cart = new ArrayList<>();
            request.getSession().setAttribute("MY_CART", cart);
        }

        cart.addAll(userService.findVideoById(id));
        cart.get(0).setNoOfDays(days);
        request.getSession().setAttribute("MY_CART", cart);
        return "redirect:/user/home";
    }

    @GetMapping("/cart")
    public String getCart(Model model, HttpServletRequest request){
        if (cart!=null)
        model.addAttribute("total_price", new CalculatePrice().calculatedPrice(cart));
        model.addAttribute("genre", userService.getAllGenre());
        model.addAttribute("type", userService.getAllType());
        model.addAttribute("cart", cart);

        request.getSession().getAttribute("MY_CART");
        return "cart";
    }

    @GetMapping("/cart/delete/{id}")
    public String deleteItemFromCart(@PathVariable("id") int id){
        cart.remove(id);
        return "redirect:/user/cart";
    }

    @PostMapping("/cart/pay")
    public String payCart(){
        userService.renteVideo(cart, new CalculatePrice().calculatedPrice(cart));
        cart.clear();
        return "redirect:/user/home";
    }



}