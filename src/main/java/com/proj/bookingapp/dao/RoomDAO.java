package com.proj.bookingapp.dao;

import com.proj.bookingapp.model.City;
import com.proj.bookingapp.model.Room;

import java.util.List;

public interface RoomDAO {
    List<Room> findAll();
    void saveRoom(Room room);
    Room findById(Long id);
    void deleteRoom(Long id);
    int getTotalRoom();
    List<Room> searchRoom(String city,Integer acom);

}
