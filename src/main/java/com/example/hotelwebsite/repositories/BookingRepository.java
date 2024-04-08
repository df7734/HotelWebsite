package com.example.hotelwebsite.repositories;

import com.example.hotelwebsite.models.Booking;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {
    //for search by date
    //List<Booking> findByDateIn(String dateIn);
}
