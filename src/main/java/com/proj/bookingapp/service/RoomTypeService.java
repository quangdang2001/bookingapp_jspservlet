package com.proj.bookingapp.service;

import com.proj.bookingapp.model.RoomType;

import java.util.List;

public interface RoomTypeService {
    List<RoomType> findAll();
    void saveRoomType(RoomType roomType);
    RoomType findById(Long id);
    void deleteRoomType(Long id);
}
