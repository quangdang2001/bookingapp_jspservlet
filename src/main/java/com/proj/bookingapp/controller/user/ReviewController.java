package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.model.Review;
import com.proj.bookingapp.model.Room;
import com.proj.bookingapp.model.User;
import com.proj.bookingapp.service.ReviewService;
import com.proj.bookingapp.service.RoomService;
import com.proj.bookingapp.service.UserService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/review"})
public class ReviewController extends HttpServlet {

    @Inject
    private ReviewService reviewService;
    @Inject
    private UserService userService;
    @Inject
    private RoomService roomService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        postCmt(req,resp);
    }
    private void postCmt (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cmt = request.getParameter("comment");
        String rate = request.getParameter("score");
        Double rating = Double.parseDouble(rate);
        String count = request.getParameter("reviewCount");
        String email = request.getParameter("email");
        String idRoom = request.getParameter("idRoom");


        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Room room = roomService.findById(Long.parseLong(idRoom));
        roomService.updateRating(Long.parseLong(idRoom),rating,Integer.parseInt(count));

        room = roomService.findById(Long.parseLong(idRoom));
        Review review = new Review(null,cmt,rating,null,user,room);

        reviewService.saveReview(review);

        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);

    }
}
