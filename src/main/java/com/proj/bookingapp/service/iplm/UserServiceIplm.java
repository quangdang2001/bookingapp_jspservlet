package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.UserDAO;
import com.proj.bookingapp.dao.iplm.UserDAOIplm;
import com.proj.bookingapp.model.User;
import com.proj.bookingapp.service.UserService;

import java.util.List;

public class UserServiceIplm implements UserService {

    private final UserDAO userDAO;

    public UserServiceIplm() {
        this.userDAO = new UserDAOIplm();
    }

    @Override
    public List<User> findAll() {
        return userDAO.findAll();
    }

    @Override
    public void saveUser(User user) {
        userDAO.saveUser(user);
    }

    @Override
    public User findById(Long id) {
        return userDAO.findById(id);
    }

    @Override
    public User findByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    @Override
    public void deleteUser(Long id) {
        userDAO.deleteUser(id);
    }

    @Override
    public int getTotalUser() {
        return userDAO.getTotalUser();
    }

    @Override
    public User findByEmailAndPass(String email, String pass) {
        return userDAO.findByEmailAndPass(email,pass);
    }
}
