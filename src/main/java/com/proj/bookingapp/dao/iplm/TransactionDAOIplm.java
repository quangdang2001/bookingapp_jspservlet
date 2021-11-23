package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.TransactionDAO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.Transaction;

import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;


public class TransactionDAOIplm implements TransactionDAO {

    @Override
    public List<Transaction> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Transaction> transactions = null;
        try {
            currentSession.beginTransaction();
            Query<Transaction> theQuery =
                    currentSession.createQuery("from Transaction ", Transaction.class);
            transactions  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
           System.out.println("Transaction find all error");
        } finally {
            currentSession.close();
        }

        return transactions;
    }

    @Override
    public void saveTransaction(Transaction transaction) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            currentSession.saveOrUpdate(transaction);
            currentSession.getTransaction().commit();
        }catch (Exception e) {
           System.out.println("transaction save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public Transaction findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        Transaction transaction = null;
        try {
            currentSession.beginTransaction();
            transaction = currentSession.get(Transaction.class, id);
            currentSession.getTransaction().commit();
        } catch (Exception e) {
           System.out.println("transaction find by id error");
        } finally {
            currentSession.close();
        }
        return transaction;
    }

    @Override
    public void deleteTransaction(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from Transaction where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
            currentSession.getTransaction().commit();
        }catch (Exception e) {
           System.out.println("Transaction delete error");
        } finally {
            currentSession.close();
        }
    }
}
