package com.example.hotelwebsite.repositories;

import com.example.hotelwebsite.models.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
