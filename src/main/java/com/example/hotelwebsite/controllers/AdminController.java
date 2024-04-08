package com.example.hotelwebsite.controllers;

import com.example.hotelwebsite.models.User;
import com.example.hotelwebsite.models.enums.Role;
import com.example.hotelwebsite.services.BookingService;
import com.example.hotelwebsite.services.RoomService;
import com.example.hotelwebsite.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
public class AdminController {
    private final UserService userService;
    private final BookingService bookingService;
    private final RoomService roomService;


    @GetMapping("/admin")
    private String admin(Model model){
        model.addAttribute("bookings", bookingService.listBookings());
        model.addAttribute("rooms", roomService.listRooms());
        model.addAttribute("users", userService.list());
        return "admin";
    }

    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id){
        userService.banUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model ) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }
}
