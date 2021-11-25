package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.Room;
import com.proj.bookingapp.service.BookingService;
import com.proj.bookingapp.service.RoomService;
import com.proj.bookingapp.utils.DateUtil;
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

@WebServlet(urlPatterns = {"/home/booking"})
public class BookingController extends HttpServlet {
    @Inject
    private RoomService roomService;
    @Inject
    private BookingService bookingService;
    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showBooking(req,resp);
    }

    private void showBooking(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String quantityPeople = request.getParameter("quantityPeople");

        quantityPeople = quantityPeople.substring(0,quantityPeople.indexOf(" "));

        Long idRoom = Long.parseLong(request.getParameter("idRoom"));
        Room room = roomService.findById(idRoom);

        SimpleDateFormat hiberFormat=new SimpleDateFormat("dd/MM/yyyy");
        Date checkInDateD = hiberFormat.parse(checkInDate);
        Date checkOutDateD = hiberFormat.parse(checkOutDate);
        long totalDay = checkOutDateD.getTime() - checkInDateD.getTime();
        totalDay = totalDay/(24 * 60 * 60 * 1000);

        Double totalPrice = totalDay*room.getPrice();

        List<Booking> bookings = bookingService.findBookingByRoomId(idRoom);
        if (bookings!=null){
            List<String> dateBlock = DateUtil.getBlockDate(bookings);
            request.setAttribute("dateBlock",dateBlock);
        }

        request.setAttribute("totalDay",totalDay);
        request.setAttribute("reviewCount",request.getParameter("reviewCount"));
        request.setAttribute("room",room);
        request.setAttribute("checkInDate",checkInDate);
        request.setAttribute("checkOutDate",checkOutDate);
        request.setAttribute("quantityPeople",quantityPeople);
        request.setAttribute("totalPrice",totalPrice+5);

        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/booking.jsp");
        rd.forward(request,response);

    }
}
