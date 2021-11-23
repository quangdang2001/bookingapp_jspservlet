package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.RoomTypeDAO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.RoomType;

import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;


public class RoomTypeDAOIplm implements RoomTypeDAO {

    @Override
    public List<RoomType> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<RoomType> roomTypes = null;
        try {
            currentSession.beginTransaction();
            Query<RoomType> theQuery =
                    currentSession.createQuery("from RoomType order by name", RoomType.class);
            roomTypes  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
           System.out.println("Room type find all error");
        } finally {
            currentSession.close();
        }
        return roomTypes;
    }

    @Override
    public void saveRoomType(RoomType roomtype) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            currentSession.saveOrUpdate(roomtype);
            currentSession.getTransaction().commit();
        }catch (Exception e) {
           System.out.println("roomtype save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public RoomType findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        RoomType roomType = null;
        try {
            currentSession.beginTransaction();
            roomType = currentSession.get(RoomType.class, id);
            currentSession.getTransaction().commit();
        } catch (Exception e) {
           System.out.println("RoomType find by id error");
        } finally {
            currentSession.close();
        }
        return roomType;
    }

    @Override
    public void deleteRoomType(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from RoomType where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
            currentSession.getTransaction().commit();
        }catch (Exception e) {
           System.out.println("RoomType delete error");
        } finally {
            currentSession.close();
        }
    }
}
