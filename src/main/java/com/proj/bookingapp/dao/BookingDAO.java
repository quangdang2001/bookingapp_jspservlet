package com.proj.bookingapp.dao;

import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.City;

import java.util.List;

public interface BookingDAO {
    List<Booking> findAll();
    void saveBooking(Booking booking);
    Booking findById(Long id);
    void deleteBooking(Long id);
    int getTotalBooking();
    Booking findByUserId(Long id);
    List<Booking> findByBookingStatus(boolean status);
    List<Booking> findBookingByRoomId(Long id);
}
