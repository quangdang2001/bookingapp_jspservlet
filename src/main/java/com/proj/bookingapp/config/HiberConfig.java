package com.proj.bookingapp.config;

import com.proj.bookingapp.model.*;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HiberConfig {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory(){
        if (sessionFactory==null){
             sessionFactory = new Configuration()
                     .configure("hibernate.cfg.xml")
                     .addAnnotatedClass(User.class)
                     .addAnnotatedClass(Booking.class)
                     .addAnnotatedClass(Building.class)
                     .addAnnotatedClass(City.class)
                     .addAnnotatedClass(Payment.class)
                     .addAnnotatedClass(Review.class)
                     .addAnnotatedClass(RoomImage.class)
                     .addAnnotatedClass(Room.class)
                     .addAnnotatedClass(RoomType.class)
                     .addAnnotatedClass(Transaction.class)
                    .buildSessionFactory();
        }
        return sessionFactory;
    }
}