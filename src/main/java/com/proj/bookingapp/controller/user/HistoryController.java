package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.dto.BookingDTO;
import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.User;
import com.proj.bookingapp.service.BookingService;
import com.proj.bookingapp.service.iplm.BookingServiceIplm;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/home/history")
public class HistoryController extends HttpServlet {

    private BookingService bookingService= new BookingServiceIplm();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        showHistory(request,response);
    }

    private void showHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user!=null){
            List<BookingDTO> bookings = bookingService.findByUserId(user.getId());

            request.setAttribute("bookings",bookings);
        }
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/trips.jsp");
        rd.forward(request,response);

    }

}
