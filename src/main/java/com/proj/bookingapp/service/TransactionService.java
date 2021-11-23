package com.proj.bookingapp.service;

import com.proj.bookingapp.model.Transaction;

import java.util.List;

public interface TransactionService {
    List<Transaction> findAll();
    void saveTransaction(Transaction transaction);
    Transaction findById(Long id);
    void deleteTransaction(Long id);
}
