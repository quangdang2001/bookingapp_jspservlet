package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.model.User;
import com.proj.bookingapp.service.UserService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login","/register"})
public class LoginController extends HttpServlet {
    @Inject
    private UserService userService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action="register";
        if(action.equals("register")) saveNewAcc(req,resp);
        if (action.equals("logout")) logout(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action="login";
        if(action.equals("register")) saveNewAcc(req,resp);
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

        Cookie cookie1 = new Cookie("username",user.getFirstName());
        cookie1.setMaxAge(60 * 60 * 24 * 365); // set age to 1 years
        cookie1.setPath("/");
        response.addCookie(cookie1);

        Cookie cookie2 = new Cookie("email",user.getEmail());
        cookie2.setMaxAge(60 * 60 * 24 * 365); // set age to 1 years
        cookie2.setPath("/");
        response.addCookie(cookie2);

        response.sendRedirect(request.getContextPath()+"/home");
    }
    private void saveNewAcc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        User user = new User(null,firstName,lastName,email,pass,"ROLE_USER",null,null);
        User user1 = userService.findByEmail(user.getEmail());
        if (user1 !=null){
            request.setAttribute("message","Email already exists!");
            request.setAttribute("action","register");
            RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/login.jsp");
            rd.forward(request,response);
        }
        userService.saveUser(user);
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/login.jsp");
        rd.forward(request,response);
    }
}
