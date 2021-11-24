package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.model.Booking;
import com.proj.bookingapp.model.Review;
import com.proj.bookingapp.model.Room;
import com.proj.bookingapp.service.BookingService;
import com.proj.bookingapp.service.ReviewService;
import com.proj.bookingapp.service.RoomService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@WebServlet(urlPatterns = {"/home/room-detail"})
public class RoomController extends HttpServlet {
    @Inject
    private RoomService roomService;
    @Inject
    private ReviewService reviewService;
    @Inject
    private BookingService bookingService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showDetail(req,resp);
    }
    private void showDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idRoom");
        if (id==null || equals("")){
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer);
        }
        Long idRoom = Long.parseLong(id);
        Room room = roomService.findById(idRoom);
        request.setAttribute("room",room);

        String rateNow = String.valueOf(room.getRating()) ;

        List<Review> reviews = reviewService.findReviewByRoom(idRoom);

        List<Booking> bookings = bookingService.findBookingByRoomId(idRoom);
        List<String> dateBlock= new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        if(bookings!=null){
            for (Booking booking : bookings){
                System.out.println(booking.getCheckInDate());
                System.out.println(booking.getCheckOutDate());
                calendar.setTime(booking.getCheckInDate());
                String date1 = calendar.get(Calendar.YEAR)+"-"+ (calendar.get(Calendar.MONTH) + 1) +"-"+ calendar.get(Calendar.DAY_OF_MONTH);
                calendar.setTime(booking.getCheckOutDate());
                String date2 = calendar.get(Calendar.YEAR)+"-"+(calendar.get(Calendar.MONTH) + 1)+"-"+ calendar.get(Calendar.DAY_OF_MONTH);

                dateBlock.add("[\""+date1+"\",\""+date2+"\"]");
                System.out.println("[\""+date1+"\",\""+date2+"\"]");
            }
            request.setAttribute("dateBlock",dateBlock);
        }

        request.setAttribute("reviews",reviews);
        request.setAttribute("reviewCount",reviews.size());

        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/detail_prod.jsp");
        rd.forward(request,response);
    }
}
