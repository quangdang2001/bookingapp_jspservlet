package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.model.*;
import com.proj.bookingapp.service.*;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;

@WebServlet(urlPatterns = {"/adminPage/room"})
@MultipartConfig
public class RoomController extends HttpServlet {


    @Inject
    private RoomService roomService;
    @Inject
    private BuildingService buildingService;
    @Inject
    private RoomTypeService roomTypeService;
    @Inject
    private RoomImageService roomImageService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null) action="load";
        switch (action){
            case "load":
                load(request,response);
                break;
            case "add":
                save(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "showForm":
                showForm(request,response);
                break;
            case "update":
                showForm(request,response);
                break;
            default:
                load(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("add")){
            save(request,response);
        }
        if (action.equals("update")){
            showForm(request,response);
        }

    }
    private void showForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String action= request.getParameter("action");
        if (action.equals("update")){
            Long id = Long.parseLong(request.getParameter("id"));
            Room room = roomService.findById(id);
            request.setAttribute("room",room);
        }

        request.setAttribute("buildings",buildingService.findAll());
        request.setAttribute("roomTypes",roomTypeService.findAll());
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/roomform.jsp");
        rd.forward(request,response);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Long id = Long.valueOf(request.getParameter("id"));
        roomService.deleteRoom(id);
        response.sendRedirect("room");
    }

    private void load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        List<Room> rooms = roomService.findAll();
        request.setAttribute("rooms",rooms);

        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/roomview.jsp");
        rd.forward(request,response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String tempId = request.getParameter("id");
        int rating =0;
        Long id = null;
        if (!tempId.equals("")){
            id =Long.valueOf(tempId);
            Room room = roomService.findById(id);
            rating = room.getRating();
        }

        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int bedCount = Integer.parseInt(request.getParameter("bedCount"));
        int bathCount =Integer.parseInt(request.getParameter("bathCount"));
        int accomodatesCount = Integer.parseInt(request.getParameter("accomodatesCount"));
        String area = request.getParameter("area");
        String idBuilding = request.getParameter("building");
        String idRoomType = request.getParameter("roomType");

        Building building = buildingService.findById(Long.parseLong(idBuilding));
        RoomType roomType = roomTypeService.findById(Long.parseLong(idRoomType));

        Room room = new Room(id,name,price,description,bedCount,bathCount,accomodatesCount,area,rating,building,roomType,null,null);

        roomService.saveRoom(room);

//        request.setAttribute("action","update");
//        request.setAttribute("id",room.getId());
//        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/adminPage/room");
//        rd.forward(request,response);
        response.sendRedirect("room?action=update&id="+room.getId());
    }

}
