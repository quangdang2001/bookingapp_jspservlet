package com.proj.bookingapp.service;

import com.proj.bookingapp.model.Room;

import java.util.Date;
import java.util.List;

public interface RoomService {
    List<Room> findAll();
    void saveRoom(Room room);
    Room findById(Long id);
    void deleteRoom(Long id);
    int getTotalRoom();
    List<Room> searchRoom(String city, Integer acom, Date bookingDateF, Date bookingDayL);
    List<Room> descendingPriceRoom(List<Room> rooms);
    List<Room> ascendingPriceRoom(List<Room> rooms);
    List<Room> filterRoom(List<String> roomTypes,List<Integer> star,Double lowPrice,Double maxPrice,List<Room> rooms);
    double getStarRoom(Long idRoom);
    void updateRating(Long idRoom, double rate, int countReview);
}
