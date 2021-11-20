package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.BookingDAO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.City;


import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;


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
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Booking find all error");
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
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            System.out.println("booking save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public Booking findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        Booking booking = null;
        try {
            currentSession.beginTransaction();
            booking = currentSession.get(Booking.class, id);
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Booking find by id error");
        } finally {
            currentSession.close();
        }
        return booking;
    }

    @Override
    public void deleteBooking(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Booking booking = currentSession.get(Booking.class,id);
            currentSession.delete(booking);
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            System.out.println("Booking delete error");
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
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            System.out.println("Booking get total error");
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
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Booking find by user id error");
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
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Booking find by status error");
        } finally {
            currentSession.close();
        }
        return bookings;
    }

    @Override
    public List<Booking> findBookingByRoomId(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Booking> bookings = null;
        try {
            currentSession.beginTransaction();
            Query<Booking> theQuery =
                    currentSession.createQuery("from Booking b where b.room.id=:theIdRoom ", Booking.class);
            theQuery.setParameter("theIdRoom",id);
            bookings  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("Booking find by booking by room id error");
        } finally {
            currentSession.close();
        }
        return bookings;
    }

}
