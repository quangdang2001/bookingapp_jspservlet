package com.proj.bookingapp.dao;

import com.proj.bookingapp.model.City;
import com.proj.bookingapp.model.Transaction;

import java.util.List;

public interface TransactionDAO {
    List<Transaction> findAll();
    void saveTransaction(Transaction transaction);
    Transaction findById(Long id);
    void deleteTransaction(Long id);
}
