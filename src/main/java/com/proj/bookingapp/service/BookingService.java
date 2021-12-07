package com.proj.bookingapp.service;

import com.proj.bookingapp.dto.BookingDTO;
import com.proj.bookingapp.model.Booking;

import java.util.List;

public interface BookingService {
    List<BookingDTO> findAll();
    void saveBooking(Booking booking);
    Booking findById(Long id);
    void deleteBooking(Long id);
    int getTotalBooking();
    List<BookingDTO> findByUserId(Long id);
    List<Booking> findByBookingStatus(boolean status);
    List<Booking> findBookingByRoomId(Long id);
}
