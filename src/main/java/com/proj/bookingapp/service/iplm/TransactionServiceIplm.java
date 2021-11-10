package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.TransactionDAO;
import com.proj.bookingapp.dao.iplm.TransactionDAOIplm;
import com.proj.bookingapp.model.Transaction;
import com.proj.bookingapp.service.TransactionService;

import java.util.List;

public class TransactionServiceIplm implements TransactionService {

    private final TransactionDAO transactionDAO;

    public TransactionServiceIplm() {
        this.transactionDAO = new TransactionDAOIplm();
    }

    @Override
    public List<Transaction> findAll() {
        return transactionDAO.findAll();
    }

    @Override
    public void saveTransaction(Transaction transaction) {
        transactionDAO.saveTransaction(transaction);
    }

    @Override
    public Transaction findById(Long id) {
        return transactionDAO.findById(id);
    }

    @Override
    public void deleteTransaction(Long id) {
        transactionDAO.deleteTransaction(id);
    }
}
