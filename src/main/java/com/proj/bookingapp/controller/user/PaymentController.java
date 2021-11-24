package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.model.*;
import com.proj.bookingapp.service.BookingService;
import com.proj.bookingapp.service.PaymentService;
import com.proj.bookingapp.service.RoomService;
import lombok.SneakyThrows;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@WebServlet(urlPatterns = {"/home/booking/payment"})
public class PaymentController extends HttpServlet {
    @Inject
    private RoomService roomService;
    @Inject
    private BookingService bookingService;
    @Inject
    private PaymentService paymentService;

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            payment(req,resp);
    }
    private void payment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

        String dateBooking = request.getParameter("dateBooking");
        dateBooking = dateBooking.trim();
        String checkInDate = dateBooking.substring(0,dateBooking.indexOf(" "));
        String checkOutDate= dateBooking.substring(dateBooking.indexOf(" ")+2,dateBooking.length());

        String quantityPeople = request.getParameter("quantityPeople");
        quantityPeople = quantityPeople.substring(0,quantityPeople.indexOf(" "));

        String id = request.getParameter("idRoom");


        SimpleDateFormat hiberFormat=new SimpleDateFormat("dd/MM/yyyy");
        Date checkInDateD = hiberFormat.parse(checkInDate);
        Date checkOutDateD = hiberFormat.parse(checkOutDate);
        long totalDay = checkOutDateD.getTime() - checkInDateD.getTime();
        totalDay = totalDay/(24 * 60 * 60 * 1000);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Room room = roomService.findById(Long.parseLong(id));
        Double totalPrice = totalDay*room.getPrice() + 5;

        Payment payment = paymentService.findByName("Chuyển Khoản");
        Transaction transaction = new Transaction(null,false,payment,null);
        Booking booking = new Booking(null,checkInDateD,checkOutDateD,totalPrice,null
                ,Integer.parseInt(quantityPeople),null,user,transaction,room);

        bookingService.saveBooking(booking);

        request.setAttribute("room",room);
        request.setAttribute("checkInDate",checkInDate);
        request.setAttribute("checkOutDate",checkOutDate);
        request.setAttribute("quantityPeople",quantityPeople);
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/success_booking.jsp");
        rd.forward(request,response);
    }
}
