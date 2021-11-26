package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.dao.CityDAO;
import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.model.City;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.internal.SessionFactoryImpl;
import org.hibernate.query.Query;


import javax.transaction.Transactional;
import java.util.List;


public class CityDAOIplm implements CityDAO {


    @Override
    public List<City> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<City> cities = null;
        try {
            currentSession.beginTransaction();
            Query<City> theQuery =
                    currentSession.createQuery("from City order by name", City.class);
            cities = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("City find all error");
        } finally {
            currentSession.close();
        }

        return cities;
    }

    @Override
    public void saveCity(City city) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            currentSession.saveOrUpdate(city);
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("City save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public City findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        City city = null;
        try {
            currentSession.beginTransaction();
            city = currentSession.get(City.class, id);
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("city find by id error");
        } finally {
             currentSession.close();
        }

        return city;
    }

    @Override
    public void deleteCity(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from City where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("City delete error");
        } finally {
            currentSession.close();
        }
    }

    @Override
    public int getTotalCity() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        int total = 0;
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("select count (*) from City");
            total = (int) theQuery.getSingleResult();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("City get total error");
        } finally {
            currentSession.close();

        }
        return total;
    }
}
