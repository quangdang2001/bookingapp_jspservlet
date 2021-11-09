package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.RoomDAO;
import com.proj.bookingapp.dao.iplm.RoomDAOIplm;
import com.proj.bookingapp.model.Room;
import com.proj.bookingapp.service.RoomService;

import java.util.List;

public class RoomServiceIplm implements RoomService {

    private final RoomDAO roomDAO;

    public RoomServiceIplm() {
        this.roomDAO = new RoomDAOIplm();
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

    @Override
    public List<Room> searchRoom(String keyword) {
        return roomDAO.searchRoom(keyword);
    }
}
