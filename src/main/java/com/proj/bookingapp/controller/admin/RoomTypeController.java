package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.model.Payment;
import com.proj.bookingapp.model.RoomType;
import com.proj.bookingapp.service.PaymentService;
import com.proj.bookingapp.service.RoomTypeService;

import javax.inject.Inject;
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
    @Inject
    private RoomTypeService roomTypeService;

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
                add(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "update":

            default:
                load(request,response);
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Long id = Long.valueOf(request.getParameter("id"));
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
    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String name = request.getParameter("name");
        String desc = request.getParameter("description");
        roomTypeService.saveRoomType(new RoomType(null,name,desc));

        response.sendRedirect("roomtype");
    }
}
