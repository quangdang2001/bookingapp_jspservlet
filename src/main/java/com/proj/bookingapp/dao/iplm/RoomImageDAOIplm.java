package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.RoomImageDAO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.Building;
import com.proj.bookingapp.model.RoomImage;

import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;


public class RoomImageDAOIplm implements RoomImageDAO {
    @Override
    public List<RoomImage> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<RoomImage> roomImages = null;
        try {
            currentSession.beginTransaction();
            Query<RoomImage> theQuery =
                    currentSession.createQuery("from RoomImage order by name", RoomImage.class);
            roomImages  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
           System.out.println("RoomImage find all error");
        } finally {
            currentSession.close();
        }
        return roomImages;
    }

    @Override
    public void saveRoomImage(RoomImage roomImage) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            currentSession.saveOrUpdate(roomImage);
            currentSession.getTransaction().commit();
        }catch (Exception e) {
           System.out.println("roomImage save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public RoomImage findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        RoomImage roomImage = null;
        try {
            currentSession.beginTransaction();
            roomImage = currentSession.get(RoomImage.class, id);
            currentSession.getTransaction().commit();
        } catch (Exception e) {
           System.out.println("RoomImage find by id error");
        } finally {
            currentSession.close();
        }
        return roomImage;
    }

    @Override
    public void deleteRoomImage(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from RoomImage where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
            currentSession.getTransaction().commit();
        }catch (Exception e) {
           System.out.println("RoomImage delete error");
        } finally {
            currentSession.close();
        }
    }
}
