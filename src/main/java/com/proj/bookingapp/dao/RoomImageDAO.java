package com.proj.bookingapp.dao;

import com.proj.bookingapp.model.RoomImage;

import java.util.List;

public interface RoomImageDAO {
    List<RoomImage> findAll();
    void saveRoomImage(RoomImage roomImage);
    RoomImage findById(Long id);
    void deleteRoomImage(Long id);
}
