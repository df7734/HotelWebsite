package com.example.hotelwebsite.controllers;


import com.example.hotelwebsite.models.Booking;
import com.example.hotelwebsite.models.Room;
import com.example.hotelwebsite.repositories.RoomRepository;
import com.example.hotelwebsite.services.BookingService;
import com.example.hotelwebsite.services.RoomService;
import com.example.hotelwebsite.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequiredArgsConstructor
public class RoomController {
    private final UserService userService;
    private final BookingService bookingService;
    private final RoomService roomService;


    @GetMapping("/room/{id}")
    public String roomInfo(@PathVariable Long id, Model model){
        model.addAttribute("room", roomService.getRoomById(id));
        model.addAttribute("bookings", bookingService.getBookingByRoomId(id));
        return "room-info";
    }

    @PostMapping("/room/create")
    public String createRoom(Room room, Model model){
        model.addAttribute("bookings", bookingService.listBookings());
        model.addAttribute("rooms", roomService.listRooms());
        model.addAttribute("users", userService.list());
        if(!roomService.saveRoom(room)){
            model.addAttribute("errorMessage",
                    "Room number already exists (" + room.getNumber() + ")");
            return "/admin";
        }
        return "redirect:/admin#roomarea";
    }

    @PostMapping("/room/delete/{id}")
    public String deleteRoom(@PathVariable Long id){
        roomService.deleteRoom(id);
        return "redirect:/admin#roomarea";
    }
}
