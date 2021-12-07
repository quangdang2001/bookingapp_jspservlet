package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.model.*;
import com.proj.bookingapp.service.UserService;
import com.proj.bookingapp.service.iplm.UserServiceIplm;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/adminPage/user"})
public class UserController extends HttpServlet {

    private UserService userService= new UserServiceIplm();

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

        User user = userService.findById(Long.parseLong(request.getParameter("id")));
        request.setAttribute("user1",user);

        List<User> users = userService.findAll();
        request.setAttribute("users",users);

        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/userview.jsp");
        rd.forward(request,response);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Long id = Long.valueOf(request.getParameter("id"));
        userService.deleteUser(id);
        response.sendRedirect("user");
    }

    private void load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        List<User> users = userService.findAll();

        request.setAttribute("users",users);

        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/userview.jsp");
        rd.forward(request,response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String tempId = request.getParameter("id");
        List<Booking> bookings = null;
        List<Review> reviews = null;
        Long id = null;
        if (!tempId.equals("")){
            id =Long.valueOf(tempId);
            User user = userService.findById(id);
            reviews = user.getReviews();
            bookings = user.getBookings();
        }

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        userService.saveUser(new User(id,firstName,lastName,email,password,role,null,null,reviews,bookings));

        response.sendRedirect("user");
    }
}
