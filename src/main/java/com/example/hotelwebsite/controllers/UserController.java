package com.example.hotelwebsite.controllers;

import com.example.hotelwebsite.models.User;
import com.example.hotelwebsite.services.BookingService;
import com.example.hotelwebsite.services.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final BookingService bookingService;

    @GetMapping("/login")
    public String login(){
        return "login";
    }


    @GetMapping("/login/error")
    public String login(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            AuthenticationException ex = (AuthenticationException) session
                    .getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
            if (ex != null) {
                model.addAttribute("errorMessage", "Wrong credentials or user doesn't exists");
            }
        }
        return "login";
    }

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model){
        if(!userService.createUser(user)){
            model.addAttribute("errorMessage",
                    "User already exists");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/user")
    public String userDetails(Principal principal, Model model){
        User user = bookingService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("bookings", bookingService.getBookingsByUserId(user.getId()));
        return "user";
    }

    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("bookings", bookingService.getBookingsByUserId(user.getId()));
        return "user-info";
    }

    @GetMapping("/user/change")
    public String changeInfo(Principal principal, Model model){
        User user = bookingService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "user-change";
    }

    @PostMapping("/user/change")
    public String changeInfo(User user){
        userService.saveUser(user);
        return "redirect:/user";
    }
}
