package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.TransactionDAO;
import com.proj.bookingapp.model.Transaction;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

@Slf4j
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
        } catch (Exception e) {
            log.error("Transaction find all error");
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
        }catch (Exception e) {
            log.error("transaction save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public Transaction findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        return currentSession.get(Transaction.class,id);
    }

    @Override
    public void deleteTransaction(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from Transaction where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
        }catch (Exception e) {
            log.error("Transaction delete error");
        } finally {
            currentSession.close();
        }
    }
}
