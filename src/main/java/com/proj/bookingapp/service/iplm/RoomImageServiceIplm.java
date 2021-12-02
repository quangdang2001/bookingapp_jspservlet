package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.RoomImageDAO;
import com.proj.bookingapp.dao.iplm.RoomImageDAOIplm;
import com.proj.bookingapp.model.RoomImage;
import com.proj.bookingapp.service.RoomImageService;
import com.proj.bookingapp.utils.S3Util;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.net.http.HttpRequest;
import java.util.List;

public class RoomImageServiceIplm implements RoomImageService {

    private final RoomImageDAO roomImageDAO;

    public RoomImageServiceIplm() {
        this.roomImageDAO = new RoomImageDAOIplm();
    }

    @Override
    public List<RoomImage> findAll() {
        return roomImageDAO.findAll();
    }

    @Override
    public void saveRoomImage(RoomImage roomImage) {
        roomImageDAO.saveRoomImage(roomImage);
    }

    @Override
    public RoomImage findById(Long id) {
        return roomImageDAO.findById(id);
    }

    @Override
    public void deleteRoomImage(Long id, String contextPath) {
        String urlImg = roomImageDAO.findById(id).getName();
        roomImageDAO.deleteRoomImage(id);

        if (urlImg.contains("s3.amazonaws.com")){
            boolean temp = S3Util.deleteObj(urlImg);
            if (!temp){
                System.out.println("Fail delete S3");
            }else {
                System.out.println("Delete Img S3 successful");
            }
        }

    }
}
