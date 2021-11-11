package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.BuildingDAO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.Building;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

@Slf4j
public class BuildingDAOIplm implements BuildingDAO {
    @Override
    public List<Building> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Building> buildings = null;
        try {
            currentSession.beginTransaction();
            Query<Building> theQuery =
                    currentSession.createQuery("from Building order by name", Building.class);
            buildings  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            log.error("Building find all error");
        } finally {
            currentSession.close();
        }
        return buildings;
    }

    @Override
    public void saveBuilding(Building building) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            currentSession.saveOrUpdate(building);
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            log.error("Building save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public Building findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        Building building = null;
        try {
            currentSession.beginTransaction();
            building = currentSession.get(Building.class, id);
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            log.error("Booking find by id error");
        } finally {
            currentSession.close();
        }

        return building;
    }

    @Override
    public void deleteBuilding(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from Building where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
            currentSession.getTransaction().commit();
        }catch (Exception e) {
            log.error("Building delete error");
        } finally {
            currentSession.close();
        }

    }
}
