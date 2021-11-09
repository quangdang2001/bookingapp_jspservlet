package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.UserDAO;
import com.proj.bookingapp.model.City;
import com.proj.bookingapp.model.User;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

@Slf4j
public class UserDAOIplm implements UserDAO {

    @Override
    public List<User> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<User> users = null;
        try {
            currentSession.beginTransaction();
            Query<User> theQuery =
                    currentSession.createQuery("from User order by firstName", User.class);
            users  = theQuery.getResultList();
        } catch (Exception e) {
            log.error("User find all error");
        } finally {
            currentSession.close();
        }

        return users;
    }

    @Override
    public void saveUser(User user) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            currentSession.saveOrUpdate(user);
        }catch (Exception e) {
            log.error("user save error");
        } finally {
            currentSession.close();
        }
    }

    @Override
    public User findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        return currentSession.get(User.class,id);
    }

    @Override
    public User findByEmail(String email) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        User user = null;
        try {
            currentSession.beginTransaction();
            Query<User> theQuery = currentSession.createQuery(" from User where email=:theEmail",User.class);
            theQuery.setParameter("theEmail", email);
            user = theQuery.getSingleResult();
        }catch (Exception e) {
            log.error("User find by email error");
        } finally {
            currentSession.close();
        }
        return user;
    }

    @Override
    public void deleteUser(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from User where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
        }catch (Exception e) {
            log.error("User delete error");
        } finally {
            currentSession.close();
        }
    }

    @Override
    public int getTotalUser() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        int total=0;
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("select count (*) from User");
            total= (int) theQuery.getSingleResult();
        }catch (Exception e) {
            log.error("User get total error");
        } finally {
            currentSession.close();
        }
        return total;
    }

    @Override
    public User findByEmailAndPass(String email, String pass) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        User user=null;
        user=findByEmail(email);
        if (user.equals(null)){
            return null;
        } else {
            try {
                currentSession.beginTransaction();
                Query<User> theQuery = currentSession.createQuery(" from User where email=:theEmail and password=:thePass"
                        , User.class);
                theQuery.setParameter("theEmail", email);
                theQuery.setParameter("thePass", pass);
                user = theQuery.getSingleResult();
            } catch (Exception e) {
                log.error("User find by email password error");
            } finally {
                currentSession.close();
            }
        }
        return user;
    }
}
