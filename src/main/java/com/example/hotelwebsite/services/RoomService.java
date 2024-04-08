package com.example.hotelwebsite.services;

import com.example.hotelwebsite.models.Booking;
import com.example.hotelwebsite.models.Room;
import com.example.hotelwebsite.repositories.BookingRepository;
import com.example.hotelwebsite.repositories.RoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoomService {
    private final RoomRepository roomRepository;
    private final BookingRepository bookingRepository;

    public List<Room> listRooms(){
        return roomRepository.findAll();
    }

    public boolean saveRoom(Room room){
        if (roomRepository.findByNumber(room.getNumber()) != null){
            return false;
        }
        roomRepository.save(room);
        return true;
    }

    public void deleteRoom(Long id){
        List<Booking> bookingList = bookingRepository.findAll();
        for(Booking booking : bookingList){
            if(booking.getRoom().getId().equals(id)){
                bookingRepository.delete(booking);
            }
        }
        roomRepository.deleteById(id);
    }

    public Room getRoomById(Long id) {
        return roomRepository.findById(id).orElse(null);
    }
}
