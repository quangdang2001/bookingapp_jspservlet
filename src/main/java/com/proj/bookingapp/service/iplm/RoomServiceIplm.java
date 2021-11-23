package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.BookingDAO;
import com.proj.bookingapp.dao.ReviewDAO;
import com.proj.bookingapp.dao.RoomDAO;
import com.proj.bookingapp.dao.iplm.BookingDAOIplm;
import com.proj.bookingapp.dao.iplm.ReviewDAOIplm;
import com.proj.bookingapp.dao.iplm.RoomDAOIplm;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.Review;
import com.proj.bookingapp.model.Room;
import com.proj.bookingapp.service.RoomService;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

public class RoomServiceIplm implements RoomService {

    private final RoomDAO roomDAO;
    private final BookingDAO bookingDAO;
    private final ReviewDAO reviewDAO;

    public RoomServiceIplm() {
        this.roomDAO = new RoomDAOIplm();
        this.reviewDAO = new ReviewDAOIplm();
        this.bookingDAO = new BookingDAOIplm();
    }

    @Override
    public List<Room> findAll() {
        return roomDAO.findAll();
    }

    @Override
    public void saveRoom(Room room) {
        roomDAO.saveRoom(room);
    }

    @Override
    public Room findById(Long id) {
        return roomDAO.findById(id);
    }

    @Override
    public void deleteRoom(Long id) {
        roomDAO.deleteRoom(id);
    }

    @Override
    public int getTotalRoom() {
        return roomDAO.getTotalRoom();
    }

    public boolean compareDay(Date bookingDayF,Date bookingDayL, Date checkDayF, Date checkDayL){
        if (bookingDayF.equals(checkDayF) || bookingDayF.equals(checkDayL)
                || bookingDayL.equals(checkDayF) || bookingDayL.equals(checkDayL))
            return false;
        if (bookingDayF.after(checkDayF) && bookingDayF.before(checkDayL)) return false;
        if (bookingDayL.after(checkDayF) && bookingDayL.before(checkDayL)) return false;
        if (bookingDayF.before(checkDayF) && bookingDayL.after(checkDayL)) return false;
        return true;
    }


    @Override
    public List<Room> searchRoom(String city, Integer acom, Date bookingDateF, Date bookingDateL) {
        List<Room> rooms = roomDAO.searchRoom(city,acom);
        if (bookingDateF!=null && bookingDateL!=null){
            List<Booking> bookings= new ArrayList<>();
            if (rooms!=null){
                for (Room room : rooms){
                    bookings = bookingDAO.findBookingByRoomId(room.getId());
                    for (Booking booking : bookings){
                        if (compareDay(bookingDateF,bookingDateL,booking.getCheckInDate(),booking.getCheckOutDate())){
                            rooms.remove(room);
                            break;
                        }
                    }
                }
            }
        }
        return rooms;
    }

    @Override
    public List<Room> descendingPriceRoom(List<Room> rooms) {
        rooms.sort((o1, o2) -> {
            double temp1 = o1.getPrice();
            double temp2 = o2.getPrice();
            return temp1 >= temp2 ? -1 : 0;
        });
        return rooms;
    }

    @Override
    public List<Room> ascendingPriceRoom(List<Room> rooms) {
        rooms.sort((o1, o2) -> {
            double temp1 = o1.getPrice();
            double temp2 = o2.getPrice();
            return temp1 <= temp2 ? -1 : 0;
        });
        return rooms;
    }

    @Override
    public List<Room> filterRoom(List<String> roomTypes, List<Integer> star, Double lowPrice, Double maxPrice,List<Room> rooms) {
        if (roomTypes!= null){
            rooms.removeIf(room -> !roomTypes.contains(room.getRoomType().getName()));
        }
        if (star!=null){
            rooms.removeIf(room -> !star.contains(room.getRating()));
        }
        if (lowPrice!= null & maxPrice!=null){
            rooms.removeIf(room -> room.getPrice() < lowPrice || room.getPrice() > maxPrice);
        }
        return rooms;
    }

    @Override
    public double getStarRoom(Long idRoom) {
        double total =0;
        List<Review> reviews = reviewDAO.findReviewByRoom(idRoom);
        if (reviews.size()!=0){
            for (Review review : reviews){
                total+=review.getRate();
            }
            total= total/reviews.size();
        }

        return total;
    }

    @Override
    public void updateRating(Long idRoom, double rate, int countReview) {
        Room room = roomDAO.findById(idRoom);
        double rateNow = room.getRating();
        rateNow = (rateNow*countReview+rate)/(countReview+1);
        BigDecimal bd = new BigDecimal(rateNow).setScale(1, RoundingMode.HALF_UP);
        double newRate = bd.doubleValue();

        room.setRating(newRate);
        roomDAO.saveRoom(room);
    }


}
