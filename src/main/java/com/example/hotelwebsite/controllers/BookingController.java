package com.example.hotelwebsite.controllers;

import com.example.hotelwebsite.models.Booking;
import com.example.hotelwebsite.models.Room;
import com.example.hotelwebsite.models.User;
import com.example.hotelwebsite.services.BookingService;
import com.example.hotelwebsite.services.RoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BookingController {

    private final BookingService bookingService;
    private final RoomService roomService;

    @GetMapping("/")
    public String bookings(Principal principal, Model model){
        model.addAttribute("bookings", bookingService.listBookings());
        model.addAttribute("rooms", roomService.listRooms());
        model.addAttribute("currentUser", bookingService.getUserByPrincipal(principal));
        return "bookings";
    }

    @GetMapping("/booking/{id}")
    public String bookingInfo(@PathVariable Long id, Model model){
        model.addAttribute("booking", bookingService.getBookingById(id));
        return "booking-info";
    }

    @PostMapping("/bookings/create")
    public String createBooking(String dateIn, String dateOut, String level, Principal principal, Model model, RedirectAttributes redirectAttrs){
        Room freeRoom = bookingService.checkFreeRoom(dateIn, dateOut, level);
        if(freeRoom != null){
            bookingService.saveBooking(principal, bookingService.bookingPreset(dateIn, dateOut, freeRoom, bookingService.countPrice(dateIn, dateOut,level)));
            redirectAttrs.addFlashAttribute("posted", true);
            return "redirect:/user#bookingarea";
        }
        else{
            System.out.println("No free rooms");
            model.addAttribute("bookings", bookingService.listBookings());
            model.addAttribute("rooms", roomService.listRooms());
            model.addAttribute("currentUser", bookingService.getUserByPrincipal(principal));
            model.addAttribute("errorMessage", "No free rooms. Try another dates or amount of guests");
            return "bookings";
        }
    }

    @PostMapping("/booking/delete/{id}")
    public String deleteBooking(@PathVariable Long id, @RequestParam(value = "user_id", required = false) Long userId, @RequestParam(value = "room_id", required = false) Long roomId){
        bookingService.deleteBooking(id);
        if(userId != null){
            return "redirect:/user/" + userId;
        }
        if(roomId != null){
            return "redirect:/room/" + roomId;
        }
        return "redirect:/admin#bookingarea";
    }

    @GetMapping("/bookings/pay/{id}")
    public String bookingPayPage(@PathVariable Long id, Model model, Principal principal){
        User user = bookingService.getUserByPrincipal(principal);
        List<Booking> bookings = bookingService.listBookings();
        for(Booking booking : bookings){
            if(booking.getId().equals(id) && booking.getUser().equals(user)){
                model.addAttribute("booking", bookingService.getBookingById(id));
                return "booking-pay";
            }
        }

        return "redirect:/user";
    }

    @PostMapping("/bookings/pay/{id}")
    public String bookingPay(@PathVariable Long id, Principal principal){
        Booking booking = bookingService.getBookingById(id);
        booking.setPaid(true);
        bookingService.saveBooking(principal, booking);
        return "redirect:/user";
    }
}
