package com.proj.bookingapp.service;

import com.proj.bookingapp.model.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    void saveUser(User user);
    User findById(Long id);
    User findByEmail(String email);
    void deleteUser(Long id);
    int getTotalUser();
    User findByEmailAndPass(String email, String pass);
}
