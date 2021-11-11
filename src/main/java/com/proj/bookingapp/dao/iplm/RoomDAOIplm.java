package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.RoomDAO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.Room;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

@Slf4j
public class RoomDAOIplm implements RoomDAO {
    @Override
    public List<Room> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Room> rooms = null;
        try {
            currentSession.beginTransaction();
            Query<Room> theQuery =
                    currentSession.createQuery("from Room order by name", Room.class);
            rooms  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            log.error("rooms find all error");
        } finally {
            currentSession.close();
        }

        return rooms;
    }

    @Override
    public void saveRoom(Room room) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            currentSession.saveOrUpdate(room);
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            log.error("room save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public Room findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        Room room = null;
        try {
            currentSession.beginTransaction();
            room = currentSession.get(Room.class, id);
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            log.error("Room find by id error");
        } finally {
            currentSession.close();
        }
        return room;
    }

    @Override
    public void deleteRoom(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from Room where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            log.error("Room delete error");
        } finally {
            currentSession.close();
        }
    }

    @Override
    public int getTotalRoom() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        int total=0;
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("select count (*) from Room");
            total= (int) theQuery.getSingleResult();
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            log.error("Room get total error");
        } finally {
            currentSession.close();

        }
        return total;
    }

    @Override
    public List<Room> searchRoom(String keyword) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Room> rooms = null;
        try {
            currentSession.beginTransaction();
            Query<Room> theQuery =
                    currentSession.createQuery(
                            "from Room r where concat(r.building.city, r.accomodatesCount) like :thekeyword"
                            , Room.class);
            theQuery.setParameter("thekeyword",keyword);
            rooms  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            log.error("rooms search error");
        } finally {
            currentSession.close();
        }

        return  rooms;
    }

}
