package com.example.hotelwebsite.services;


import com.example.hotelwebsite.models.Booking;
import com.example.hotelwebsite.models.Room;
import com.example.hotelwebsite.models.User;
import com.example.hotelwebsite.repositories.BookingRepository;
import com.example.hotelwebsite.repositories.RoomRepository;
import com.example.hotelwebsite.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BookingService {
    private final BookingRepository bookingRepository;
    private final UserRepository userRepository;
    private final RoomRepository roomRepository;

    public List<Booking> listBookings(){
        return bookingRepository.findAll();
    }

    public void saveBooking(Principal principal, Booking booking){
        booking.setUser(getUserByPrincipal(principal));
        bookingRepository.save(booking);
    }

    public Booking bookingPreset(String dateIn, String dateOut, Room freeRoom, int countPrice) {
        Booking booking = new Booking();
        booking.setDateIn(dateIn);
        booking.setDateOut(dateOut);
        booking.setPaid(false);
        booking.setRoom(freeRoom);
        booking.setPrice(countPrice);
        return booking;
    }

    public int countPrice(String dateIn, String dateOut, String level) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate date1 = LocalDate.parse(dateIn, dtf);
        LocalDate date2 = LocalDate.parse(dateOut, dtf);
        int daysBetween = (int) ChronoUnit.DAYS.between(date1, date2);
        daysBetween++;

        if(level.equals("1-2 Guests")){
            return 100*daysBetween;
        }
        else if(level.equals("3-4 Guests")){
            return 200*daysBetween;
        }
        else {
            return 300*daysBetween;
        }
    }


    public User getUserByPrincipal(Principal principal) {
        if(principal == null){
            return new User();
        }
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteBooking(Long id){
        bookingRepository.deleteById(id);
    }

    public Booking getBookingById(Long id) {
        return bookingRepository.findById(id).orElse(null);
    }

    public List<Booking> getBookingsByUserId(Long id) {
        List<Booking> bookingList = bookingRepository.findAll();
        bookingList.removeIf(booking -> !booking.getUser().getId().equals(id));
        return  bookingList;
    }

    public Room checkFreeRoom(String dateIn, String dateOut, String level) {
        List<Room> roomList = roomRepository.findAll();
        List<Booking> bookingList = bookingRepository.findAll();
        List<Room> roomsThatMatch = new ArrayList<>();
        List<Booking> bookingsThatMatch = new ArrayList<>();
        for (Room room: roomList) {
            if(room.getLevel().equals(level)){
                roomsThatMatch.add(room);
            }
        }
        for(Booking booking: bookingList){
            for (Room room: roomsThatMatch) {
                if (booking.getRoom().equals(room)){
                    bookingsThatMatch.add(booking);
                }
            }
        }
        for(Booking booking: bookingsThatMatch){
            int date1 = convertDate(booking.getDateIn());
            int date2 = convertDate(booking.getDateOut());
            int date1Suggested = convertDate(dateIn);
            int date2Suggested = convertDate(dateOut);

            if(date1Suggested <= date2 && date2Suggested >= date1){
                roomsThatMatch.remove(booking.getRoom());
            }
        }
        if(roomsThatMatch.size() != 0){
            return roomsThatMatch.get(0);
        }
        return null;
    }

    public int convertDate(String date){
        return Integer.parseInt(date.replaceAll("[^0-9]", ""));
    }

    public List<Booking> getBookingByRoomId(Long id) {
        List<Booking> bookingList = bookingRepository.findAll();
        bookingList.removeIf(booking -> !booking.getRoom().getId().equals(id));
        return bookingList;
    }
}
