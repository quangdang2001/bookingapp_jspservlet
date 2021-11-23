package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.BookingDAO;
import com.proj.bookingapp.dao.iplm.BookingDAOIplm;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.service.BookingService;
import lombok.RequiredArgsConstructor;

import java.util.List;

public class BookingServiceIplm implements BookingService {

    private final BookingDAO bookingDAO;

    public BookingServiceIplm() {
        this.bookingDAO = new BookingDAOIplm();
    }

    @Override
    public List<Booking> findAll() {
        return bookingDAO.findAll();
    }

    @Override
    public void saveBooking(Booking booking) {
        bookingDAO.saveBooking(booking);
    }

    @Override
    public Booking findById(Long id) {
        return bookingDAO.findById(id);
    }

    @Override
    public void deleteBooking(Long id) {
        bookingDAO.deleteBooking(id);
    }

    @Override
    public int getTotalBooking() {
        return bookingDAO.getTotalBooking();
    }

    @Override
    public Booking findByUserId(Long id) {
        return bookingDAO.findByUserId(id);
    }

    @Override
    public List<Booking> findByBookingStatus(boolean status) {
        return bookingDAO.findByBookingStatus(status);
    }

    @Override
    public List<Booking> findBookingByRoomId(Long id) {
        return null;
    }
}
