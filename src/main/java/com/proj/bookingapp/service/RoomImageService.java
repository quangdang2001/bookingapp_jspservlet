package com.proj.bookingapp.service;

import com.proj.bookingapp.model.RoomImage;

import java.util.List;

public interface RoomImageService {
    List<RoomImage> findAll();
    void saveRoomImage(RoomImage roomImage);
    RoomImage findById(Long id);
    void deleteRoomImage(Long id);
}
