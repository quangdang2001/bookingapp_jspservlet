package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.PaymentDAO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.Payment;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;
@Slf4j
public class PaymentDAOIplm implements PaymentDAO {

    @Override
    public List<Payment> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Payment> payments = null;
        try {
            currentSession.beginTransaction();
            Query<Payment> theQuery =
                    currentSession.createQuery("from Payment order by name", Payment.class);
            payments  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            log.error("Payment find all error");
        } finally {
            currentSession.close();
        }
        return payments;
    }

    @Override
    public void savePayment(Payment payment) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            currentSession.saveOrUpdate(payment);
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            log.error("Payment save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public Payment findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        Payment payment = null;
        try {
            currentSession.beginTransaction();
            payment = currentSession.get(Payment.class, id);
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            log.error("payment find by id error");
        } finally {
            currentSession.close();
        }
        return payment;
    }

    @Override
    public void deletePayment(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from Payment where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            log.error("City delete error");
        } finally {
            currentSession.close();
        }
    }
}
