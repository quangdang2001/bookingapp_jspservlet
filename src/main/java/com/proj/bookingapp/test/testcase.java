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
import com.proj.bookingapp.service.RoomService;
import com.proj.bookingapp.service.iplm.BuildingServiceIplm;
import com.proj.bookingapp.service.iplm.CityServiceIplm;
import com.proj.bookingapp.service.iplm.PaymentServiceIplm;
import com.proj.bookingapp.service.iplm.RoomServiceIplm;
import org.hibernate.Session;
import org.junit.jupiter.api.Test;

import java.util.*;


public class testcase {
    private static final long serialVersionUID = 1L;
    CityDAOIplm cityDAOIplm = new CityDAOIplm();
    RoomTypeDAO roomTypeDAO = new RoomTypeDAOIplm();
    BuildingService buildingService = new BuildingServiceIplm();
    CityService cityService = new CityServiceIplm();
    PaymentService paymentService = new PaymentServiceIplm();
    RoomDAO roomDAO = new RoomDAOIplm();
    RoomService roomService = new RoomServiceIplm();

    public testcase() {
    }

    @Test
    void testdb() {
        for (int i = 0; i < 20; i++)
            System.out.println(HiberConfig.getSessionFactory().getCurrentSession());
    }
    @Test
    void searchRoom(){
        List<Room> room = roomDAO.searchRoom("Nha Trang",1);
        room.sort((o1, o2) -> {
            double temp1 = o1.getPrice();
            double temp2 = o2.getPrice();
            return temp1 >= temp2 ? -1 : 0;
        });
        for (Room room1 : room){
            System.out.println(room1.getPrice());
        }
    }
    @Test
    void findReview(){
        System.out.println(roomService.getStarRoom(Long.parseLong("2490")));

    }
}