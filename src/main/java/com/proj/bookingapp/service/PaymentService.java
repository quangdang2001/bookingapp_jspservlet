package com.proj.bookingapp.service;

import com.proj.bookingapp.model.Payment;

import java.util.List;

public interface PaymentService {
    List<Payment> findAll();
    void savePayment(Payment payment);
    Payment findById(Long id);
    void deletePayment(Long id);
    Payment findByName(String name);
}
