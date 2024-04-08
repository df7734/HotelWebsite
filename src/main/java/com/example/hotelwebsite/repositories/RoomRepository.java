package com.example.hotelwebsite.repositories;

import com.example.hotelwebsite.models.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomRepository extends JpaRepository<Room, Long> {
    Room findByNumber(int number);
}
