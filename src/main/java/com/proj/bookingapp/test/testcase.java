package com.proj.bookingapp.test;


import com.proj.bookingapp.config.HiberConfig;
import com.proj.bookingapp.dao.RoomDAO;
import com.proj.bookingapp.dao.RoomTypeDAO;
import com.proj.bookingapp.dao.iplm.CityDAOIplm;
import com.proj.bookingapp.dao.iplm.RoomDAOIplm;
import com.proj.bookingapp.dao.iplm.RoomTypeDAOIplm;
import com.proj.bookingapp.model.*;
import com.proj.bookingapp.service.BuildingService;
import com.proj.bookingapp.service.CityService;
import com.proj.bookingapp.service.PaymentService;
import com.proj.bookingapp.service.iplm.BuildingServiceIplm;
import com.proj.bookingapp.service.iplm.CityServiceIplm;
import com.proj.bookingapp.service.iplm.PaymentServiceIplm;
import org.junit.jupiter.api.Test;

import javax.inject.Inject;


public class testcase {
    private static final long serialVersionUID = 1L;
    CityDAOIplm cityDAOIplm = new CityDAOIplm();
    RoomTypeDAO roomTypeDAO = new RoomTypeDAOIplm();
    BuildingService buildingService = new BuildingServiceIplm();
    CityService cityService= new CityServiceIplm();
    PaymentService paymentService = new PaymentServiceIplm();
    RoomDAO roomDAO = new RoomDAOIplm();
    public testcase() {
    }

    @Test
    void testdb(){
        for (int i=0;i<20;i++)
        System.out.println(HiberConfig.getSessionFactory().getCurrentSession());
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

    @Test
    void testCityService(){
        System.out.println(cityService.findById(Long.valueOf(1)));

    }
    @Test
    void testBuildingService(){
        Building city = buildingService.findById(Long.valueOf(1));
        City city1 = city.getCity();
        System.out.println(city1.getName());

    }
    @Test
    void da(){
        RoomType roomType = new RoomType(null,"quang","test");
        roomTypeDAO.saveRoomType(roomType);
    }

    @Test
    void asd(){
        Room room = roomDAO.findById(Long.valueOf(7));
        System.out.println(room);

    }


}
