package com.proj.bookingapp.service;

import com.proj.bookingapp.model.Booking;

import java.util.List;

public interface BookingService {
    List<Booking> findAll();
    void saveBooking(Booking booking);
    Booking findById(Long id);
    void deleteBooking(Long id);
    int getTotalBooking();
    List<Booking> findByUserId(Long id);
    List<Booking> findByBookingStatus(boolean status);
    List<Booking> findBookingByRoomId(Long id);
}
