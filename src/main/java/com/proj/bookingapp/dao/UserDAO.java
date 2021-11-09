package com.proj.bookingapp.dao;

import com.proj.bookingapp.model.User;

import java.util.List;

public interface UserDAO {
    List<User> findAll();
    void saveUser(User user);
    User findById(Long id);
    User findByEmail(String email);
    void deleteUser(Long id);
    int getTotalUser();
    User findByEmailAndPass(String email, String pass);
}
