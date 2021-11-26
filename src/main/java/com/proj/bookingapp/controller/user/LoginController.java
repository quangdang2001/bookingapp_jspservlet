package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.model.User;
import com.proj.bookingapp.service.UserService;
import com.proj.bookingapp.service.iplm.UserServiceIplm;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    private UserService userService = new UserServiceIplm();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || action.equals("")){
            resp.sendRedirect(req.getContextPath()+"/user/view/login.jsp");
            return;
        }
        if (action.equals("logout")) logout(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action="login";
        if(action.equals("login")) login(req,resp);

    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie1 : cookies){
            cookie1.setMaxAge(0);
        }
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        User user = userService.findByEmailAndPass(email,pass);
        if (user == null) {
            request.setAttribute("message","Incorrect email or password");
            RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/login.jsp");
            rd.forward(request,response);
        }
        HttpSession session = request.getSession();
        session.setAttribute("user",user);

        Cookie cookie2 = new Cookie("email",user.getEmail());
        cookie2.setMaxAge(60 * 60 * 24 * 365); // set age to 1 years
        cookie2.setPath("/");
        response.addCookie(cookie2);

        response.sendRedirect(request.getContextPath()+"/home");
    }

}
