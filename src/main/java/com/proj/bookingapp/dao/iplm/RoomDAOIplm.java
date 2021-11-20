package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.RoomDAO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.Review;
import com.proj.bookingapp.model.Room;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
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
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
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
            Room room = currentSession.get(Room.class,id);
            currentSession.delete(room);
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            System.out.println(e.getMessage());
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
            System.out.println(e.getMessage());
        } finally {
            currentSession.close();

        }
        return total;
    }

    @Override
    public List<Room> searchRoom(String city,Integer acom) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Room> rooms = null;
        try {
            currentSession.beginTransaction();
            Query<Room> theQuery =
                    currentSession.createQuery(
                            "from Room r where r.building.city.name like :theCity and r.accomodatesCount >=:theAcom " +
                                    "order by rating DESC"
                            , Room.class);
            theQuery.setParameter("theCity","%"+city+"%");
            theQuery.setParameter("theAcom",acom);
            rooms  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            currentSession.close();
        }

        return  rooms;
    }


}
