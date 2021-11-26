package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.model.Payment;
import com.proj.bookingapp.model.Room;
import com.proj.bookingapp.model.RoomImage;
import com.proj.bookingapp.service.RoomImageService;
import com.proj.bookingapp.service.RoomService;
import com.proj.bookingapp.service.UpLoadFile;
import com.proj.bookingapp.service.iplm.RoomImageServiceIplm;
import com.proj.bookingapp.service.iplm.RoomServiceIplm;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Collection;
import java.util.List;

@WebServlet(urlPatterns = {"/adminPage/roomImage"})
@MultipartConfig
public class RoomImageController extends HttpServlet {


    private RoomService roomService= new RoomServiceIplm();

    private RoomImageService roomImageService = new RoomImageServiceIplm();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null) action="load";
        switch (action){
            case "add":
                save(request,response);
                break;
            case "delete":
                delete(request,response);
                break;

        }
    }
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Long id = Long.valueOf(request.getParameter("idImg"));
        roomImageService.deleteRoomImage(id);
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
    }
    private void save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        Long idRoom = Long.parseLong(request.getParameter("idRoom"));
        Room room = roomService.findById(idRoom);

        Collection<Part> parts = request.getParts();
        String realPath = request.getServletContext().getRealPath("");
        List<String> imgs= UpLoadFile.upLoad(parts,realPath);

        for (String img : imgs){
            roomImageService.saveRoomImage(new RoomImage(null,img,room));
        }

        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
    }
}
