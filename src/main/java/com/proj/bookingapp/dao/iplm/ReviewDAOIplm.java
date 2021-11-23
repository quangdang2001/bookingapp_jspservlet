package com.proj.bookingapp.dao.iplm;

import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.ReviewDAO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.Building;
import com.proj.bookingapp.model.Review;
import com.proj.bookingapp.model.Room;

import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;


public class ReviewDAOIplm implements ReviewDAO {
    @Override
    public List<Review> findAll() {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Review> reviews = null;
        try {
            currentSession.beginTransaction();
            Query<Review> theQuery =
                    currentSession.createQuery("from Review", Review.class);
            reviews  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
           System.out.println("Review find all error");
        } finally {
            currentSession.close();
        }
        return reviews;
    }

    @Override
    public void saveReview(Review review) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            currentSession.saveOrUpdate(review);
            currentSession.getTransaction().commit();
        }catch (Exception e) {
           System.out.println("Review save error");
        } finally {
            currentSession.close();

        }
    }

    @Override
    public Review findById(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        Review review = null;
        try {
            currentSession.beginTransaction();
            review = currentSession.get(Review.class, id);
            currentSession.getTransaction().commit();
        } catch (Exception e) {
           System.out.println("Review find by id error");
        } finally {
            currentSession.close();
        }
        return review;
    }

    @Override
    public void deleteReview(Long id) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        try {
            currentSession.beginTransaction();
            Query theQuery = currentSession.createQuery("delete from Review where id=:theid");
            theQuery.setParameter("theid", id);
            theQuery.executeUpdate();
            currentSession.getTransaction().commit();
        }catch (Exception e) {
           System.out.println("Review delete error");
        } finally {
            currentSession.close();
        }
    }

    @Override
    public List<Review> findReviewByRoom(Long idRoom) {
        Session currentSession = HiberConfig.getSessionFactory().getCurrentSession();
        List<Review> reviews = null;
        try {
            currentSession.beginTransaction();
            Query<Review> theQuery =
                    currentSession.createQuery(
                            "from Review r where r.room.id =:theId "
                            , Review.class);
            theQuery.setParameter("theId",idRoom);

            reviews  = theQuery.getResultList();
            currentSession.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            currentSession.close();
        }
        return reviews;
    }
}
