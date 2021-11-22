package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.model.User;
import com.proj.bookingapp.service.UserService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login","/register"})
public class LoginController extends HttpServlet {
    @Inject
    private UserService userService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action="login";
        if(action.equals("login")) loginPage(req,resp);
        if(action.equals("register")) saveNewAcc(req,resp);
    }
    private void loginPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/login.jsp");
        rd.forward(request,response);
    }
    private void saveNewAcc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        User user = new User(null,firstName,lastName,email,pass,"ROLE_USER",null,null);
        userService.saveUser(user);
        response.sendRedirect("login");
    }
}
