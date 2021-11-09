package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.dao.CityDAO;
import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.model.City;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

@Slf4j
public class CityDAOIplm implements CityDAO {

    @Override
    public List<City> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<City> cities = null;
        try {
            currentSession.beginTransaction();
            Query<City> theQuery =
                    currentSession.createQuery("from City order by name", City.class);
            cities  = theQuery.getResultList();
        } catch (Exception e) {
            log.error("City find all error");
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
        }catch (Exception e) {
            log.error("City save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public City findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        return currentSession.get(City.class,id);
    }

    @Override
    public void deleteCity(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from City where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
        }catch (Exception e) {
            log.error("City delete error");
        } finally {
            currentSession.close();
        }
    }

    @Override
    public int getTotalCity() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        int total=0;
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("select count (*) from City");
            total= (int) theQuery.getSingleResult();
        }catch (Exception e) {
            log.error("City get total error");
        } finally {
            currentSession.close();

        }
        return total;
    }
}
