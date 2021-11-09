package com.proj.bookingapp.test;


import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.iplm.CityDAOIplm;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.City;
import com.proj.bookingapp.service.CityService;
import com.proj.bookingapp.service.iplm.CityServiceIplm;
import org.junit.jupiter.api.Test;

import javax.inject.Inject;


public class testcase {
    private static final long serialVersionUID = 1L;
    CityDAOIplm cityDAOIplm = new CityDAOIplm();


    CityService cityService= new CityServiceIplm();

    public testcase() {
    }

    //    @Test
    void testdb(){
        System.out.println(HiberConfig.getSessionFactory());
    }
//    @Test
    void testcityDAO(){
        City city = new City(null,"city",null);

        cityDAOIplm.saveCity(city);
        System.out.println(cityDAOIplm.getTotalCity());
    }

//    @Test
    void testBookingTransaction(){
        for (int i = 1;i<10;i++)
        System.out.println(HiberConfig.getSessionFactory());
    }

    @Test
    void testCityService(){
        City city = new City(null,"HCM",null);
        cityService.saveCity(city);

    }
}
