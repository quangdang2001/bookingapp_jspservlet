package com.proj.bookingapp.dao;

import com.proj.bookingapp.model.Room;
import com.proj.bookingapp.model.RoomType;

import java.util.List;

public interface RoomTypeDAO {
    List<RoomType> findAll();
    void saveRoomType(RoomType roomType);
    RoomType findById(Long id);
    void deleteRoomType(Long id);
}
