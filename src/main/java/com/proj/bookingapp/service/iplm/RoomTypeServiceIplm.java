package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.RoomTypeDAO;
import com.proj.bookingapp.dao.iplm.RoomTypeDAOIplm;
import com.proj.bookingapp.model.RoomType;
import com.proj.bookingapp.service.RoomTypeService;

import java.util.List;

public class RoomTypeServiceIplm implements RoomTypeService {
    private final RoomTypeDAO roomTypeDAO;

    public RoomTypeServiceIplm() {
        this.roomTypeDAO = new RoomTypeDAOIplm();
    }

    @Override
    public List<RoomType> findAll() {
        return roomTypeDAO.findAll();
    }

    @Override
    public void saveRoomType(RoomType roomType) {
        roomTypeDAO.saveRoomType(roomType);
    }

    @Override
    public RoomType findById(Long id) {
        return roomTypeDAO.findById(id);
    }

    @Override
    public void deleteRoomType(Long id) {
        roomTypeDAO.deleteRoomType(id);
    }
}
