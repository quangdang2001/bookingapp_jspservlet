package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.PaymentDAO;
import com.proj.bookingapp.dao.iplm.PaymentDAOIplm;
import com.proj.bookingapp.model.Payment;
import com.proj.bookingapp.service.PaymentService;

import java.util.List;

public class PaymentServiceIplm implements PaymentService {

    private final PaymentDAO paymentDAO;

    public PaymentServiceIplm() {
        this.paymentDAO = new PaymentDAOIplm();
    }

    @Override
    public List<Payment> findAll() {
        return paymentDAO.findAll();
    }

    @Override
    public void savePayment(Payment payment) {
        paymentDAO.savePayment(payment);
    }

    @Override
    public Payment findById(Long id) {
        return paymentDAO.findById(id);
    }

    @Override
    public void deletePayment(Long id) {
        paymentDAO.deletePayment(id);
    }

    @Override
    public Payment findByName(String name) {
        return paymentDAO.findByName(name);
    }
}
