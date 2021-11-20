package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.model.*;
import com.proj.bookingapp.service.BookingService;
import com.proj.bookingapp.service.RoomService;
import com.proj.bookingapp.service.UserService;
import lombok.SneakyThrows;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/adminPage/booking"})
public class BookingController extends HttpServlet {

    @Inject
    private BookingService bookingService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null) action="load";
        switch (action){
            case "load":
                load(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "update":
                showForm(request,response);
                break;
            case "showForm":
                showForm(request,response);
                break;
            default:
                load(request,response);
        }
    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "save":
                save(request,response);
                break;
            default:
                load(request,response);
        }
    }
    private void showForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String action= request.getParameter("action");
        if (action.equals("update")){
            Long id = Long.parseLong(request.getParameter("id"));
            Booking booking = bookingService.findById(id);
            request.setAttribute("booking",booking);
        }

        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/bookingform.jsp");
        rd.forward(request,response);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Long id = Long.valueOf(request.getParameter("id"));
        bookingService.deleteBooking(id);
        response.sendRedirect("room");
    }

    private void load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        List<Booking> bookings = bookingService.findAll();
        request.setAttribute("bookings",bookings);

        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/bookingview.jsp");
        rd.forward(request,response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

        String tempId = request.getParameter("id");
        Long id = null;
        if (!tempId.equals("")){
            id =Long.valueOf(tempId);
        }
        Booking booking = bookingService.findById(id);

        SimpleDateFormat hiberFormat=new SimpleDateFormat("dd MMM yyyy");
//        Date checkInDate =hiberFormat.parse(request.getParameter("checkInDate"));
//        Date checkOutDate =hiberFormat.parse(request.getParameter("checkOutDate"));
//        System.out.println(checkOutDate);
//        System.out.println(request.getParameter("cancelDate"));
        Date cancelDate =hiberFormat.parse(request.getParameter("cancelDate"));
//        System.out.println(cancelDate);
//        Date bookingDate =hiberFormat.parse(request.getParameter("bookingDate"));
//        double priceForStay = Double.parseDouble(request.getParameter("priceForStay"));
        String status = request.getParameter("status");
        boolean bStatus;
        if (status !=null && status.equals("true")) bStatus=true;
        else bStatus=false;

//        booking = new Booking();
        booking.setStatus(bStatus);
        booking.setCancelDate(cancelDate);
//
//        booking.setId(null);
//        booking.setCheckInDate(checkInDate);
//        booking.setCheckOutDate(checkOutDate);
//        booking.setCancelDate(cancelDate);
//        booking.setPriceForStay(priceForStay);
////        booking.setBookingDate(bookingDate);


        bookingService.saveBooking(booking);
        response.sendRedirect("booking");
    }
}
