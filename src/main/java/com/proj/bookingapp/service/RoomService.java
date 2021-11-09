package com.proj.bookingapp.service;

import com.proj.bookingapp.model.Room;

import java.util.List;

public interface RoomService {
    List<Room> findAll();
    void saveRoom(Room room);
    Room findById(Long id);
    void deleteRoom(Long id);
    int getTotalRoom();
    List<Room> searchRoom(String keyword);
}
