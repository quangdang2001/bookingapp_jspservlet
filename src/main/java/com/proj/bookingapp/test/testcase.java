package com.proj.bookingapp.test;


import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.iplm.CityDAOIplm;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.City;
import org.junit.jupiter.api.Test;



public class testcase {
    CityDAOIplm cityDAOIplm = new CityDAOIplm();

    @Test
    void testdb(){
        System.out.println(HiberConfig.getSessionFactory());
    }
    @Test
    void testcityDAO(){
        City city = new City(null,"city",null);

        cityDAOIplm.saveCity(city);
        System.out.println(cityDAOIplm.getTotalCity());
    }

    @Test
    void testBookingTransaction(){
        for (int i = 1;i<10;i++)
        System.out.println(HiberConfig.getSessionFactory());
    }
}
