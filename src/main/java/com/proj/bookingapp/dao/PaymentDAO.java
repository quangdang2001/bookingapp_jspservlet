package com.proj.bookingapp.dao;

import com.proj.bookingapp.model.City;
import com.proj.bookingapp.model.Payment;

import java.util.List;

public interface PaymentDAO {
    List<Payment> findAll();
    void savePayment(Payment payment);
    Payment findById(Long id);
    void deletePayment(Long id);
}
