package com.proj.bookingapp.service;

import com.proj.bookingapp.model.RoomImage;

import javax.servlet.http.HttpServletRequest;
import java.net.http.HttpRequest;
import java.util.List;

public interface RoomImageService {
    List<RoomImage> findAll();
    void saveRoomImage(RoomImage roomImage);
    RoomImage findById(Long id);
    void deleteRoomImage(Long id, String contextPath);

}
