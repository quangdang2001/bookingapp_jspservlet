package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.model.Payment;
import com.proj.bookingapp.model.RoomType;
import com.proj.bookingapp.service.PaymentService;
import com.proj.bookingapp.service.RoomTypeService;
import com.proj.bookingapp.service.iplm.RoomTypeServiceIplm;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/adminPage/roomtype"})
public class RoomTypeController extends HttpServlet {

    private RoomTypeService roomTypeService= new RoomTypeServiceIplm();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            case "update":
                update(request,response);
                break;
            default:
                load(request,response);
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        RoomType roomType = roomTypeService.findById(Long.parseLong(request.getParameter("id")));
        request.setAttribute("roomtype",roomType);

        List<RoomType> roomTypes = new ArrayList<>();
        roomTypes= roomTypeService.findAll();
        request.setAttribute("roomtypes",roomTypes);
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/roomtypeview.jsp");
        rd.forward(request,response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Long id = Long.parseLong(request.getParameter("id"));
        roomTypeService.deleteRoomType(id);
        response.sendRedirect("roomtype");
    }

    private void load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        List<RoomType> roomTypes = new ArrayList<>();
        roomTypes= roomTypeService.findAll();
        request.setAttribute("roomtypes",roomTypes);
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/roomtypeview.jsp");
        rd.forward(request,response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String tempId = request.getParameter("id");
        System.out.println(">>>>>>>>>>>"+tempId);
        Long id = null;
        if (!tempId.equals("")){
            id =Long.valueOf(tempId);
        }

        String name = request.getParameter("name");
        String desc = request.getParameter("description");
        roomTypeService.saveRoomType(new RoomType(id,name,desc));

        response.sendRedirect("roomtype");
    }
}
