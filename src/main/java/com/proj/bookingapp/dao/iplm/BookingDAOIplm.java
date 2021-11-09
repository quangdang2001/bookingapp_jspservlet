package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.BookingDAO;
import com.proj.bookingapp.model.Booking;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

@Slf4j
public class BookingDAOIplm implements BookingDAO {
    @Override
    public List<Booking> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Booking> bookings = null;
        try {
            currentSession.beginTransaction();
            Query<Booking> theQuery =
                    currentSession.createQuery("from Booking", Booking.class);
            bookings  = theQuery.getResultList();
        } catch (Exception e) {
            log.error("Booking find all error");
        } finally {
            currentSession.close();
        }

        return bookings;
    }

    @Override
    public void saveBooking(Booking booking) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            currentSession.saveOrUpdate(booking);
        }catch (Exception e) {
            log.error("booking save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public Booking findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        return currentSession.get(Booking.class,id);
    }

    @Override
    public void deleteBooking(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from Booking where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
        }catch (Exception e) {
            log.error("Booking delete error");
        } finally {
            currentSession.close();
        }
    }

    @Override
    public int getTotalBooking() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        int total=0;
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("select count (*) from Booking ");
            total= (int) theQuery.getSingleResult();
        }catch (Exception e) {
            log.error("Booking get total error");
        } finally {
            currentSession.close();

        }
        return total;
    }

    @Override
    public Booking findByUserId(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        Booking bookings = null;
        try {
            currentSession.beginTransaction();
            Query<Booking> theQuery =
                    currentSession.createQuery("from Booking b where b.user.id=:theid ", Booking.class);
            theQuery.setParameter("theid",id);
            bookings  = theQuery.getSingleResult();
        } catch (Exception e) {
            log.error("Booking find by user id error");
        } finally {
            currentSession.close();
        }

        return bookings;
    }

    @Override
    public List<Booking> findByBookingStatus(boolean status) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Booking> bookings = null;
        try {
            currentSession.beginTransaction();
            Query<Booking> theQuery =
                    currentSession.createQuery("from Booking b where b.status=:thestatus ", Booking.class);
            theQuery.setParameter("thestatus",status);
            bookings  = theQuery.getResultList();
        } catch (Exception e) {
            log.error("Booking find by status error");
        } finally {
            currentSession.close();
        }
        return bookings;
    }

}
