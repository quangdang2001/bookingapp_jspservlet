package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.BookingDAO;
import com.proj.bookingapp.dao.iplm.BookingDAOIplm;
import com.proj.bookingapp.dto.BookingDTO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.service.BookingService;
import lombok.RequiredArgsConstructor;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class BookingServiceIplm implements BookingService {

    private final BookingDAO bookingDAO;

    public BookingServiceIplm() {
        this.bookingDAO = new BookingDAOIplm();
    }

    @Override
    public List<BookingDTO> findAll() {
        List<Booking> bookings = bookingDAO.findAll();

        List<BookingDTO> bookingDTOS = new ArrayList<>();
        for (Booking booking : bookings){
            DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            String bookingdate = booking.getBookingDate().format(format);
            bookingDTOS.add(new BookingDTO(booking.getId(),booking.getCheckInDate(),booking.getCheckOutDate(),
                    booking.getPriceForStay(),booking.getQuantityPeople(),bookingdate,booking.getTransaction(),
                    booking.getRoom(),booking.getUser(),booking.getCancelDate()));
        }
        return bookingDTOS;
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
    public List<BookingDTO> findByUserId(Long id) {
        List<Booking> bookings = bookingDAO.findByUserId(id);
        List<BookingDTO> bookingDTOS = new ArrayList<>();
        for (Booking booking : bookings){
            DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            String bookingdate = booking.getBookingDate().format(format);
            bookingDTOS.add(new BookingDTO(booking.getId(),booking.getCheckInDate(),booking.getCheckOutDate(),
                    booking.getPriceForStay(),booking.getQuantityPeople(),bookingdate,booking.getTransaction(),
                    booking.getRoom(),null,null));
        }
        return  bookingDTOS;
    }

    @Override
    public List<Booking> findByBookingStatus(boolean status) {
        return bookingDAO.findByBookingStatus(status);
    }

    @Override
    public List<Booking> findBookingByRoomId(Long id) {
        return bookingDAO.findBookingByRoomId(id);
    }
}
