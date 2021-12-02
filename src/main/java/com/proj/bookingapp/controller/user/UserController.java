package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.model.User;
import com.proj.bookingapp.service.UserService;
import com.proj.bookingapp.service.iplm.UserServiceIplm;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/home/user"})
public class UserController extends HttpServlet {

    private UserService userService= new UserServiceIplm();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null || action.equals("")) action="load";
        if (action.equals("load")) showUser(req,resp);
        if (action.equals("update")) updateUser(req,resp);
    }

    private void showUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("user",user);

        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/account.jsp");
        rd.forward(request,response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fName= request.getParameter("fName");
        String lName = request.getParameter("lName");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        user.setFirstName(fName);
        user.setLastName(lName);
        user.setPassword(password);
        if (phone!=null && !phone.equals(""))
        user.setPhone(phone);
        if (address!=null && !address.equals(""))
        user.setAddress(address);

        userService.saveUser(user);
        session.setAttribute("user",user);

        response.sendRedirect("user");
    }
}
