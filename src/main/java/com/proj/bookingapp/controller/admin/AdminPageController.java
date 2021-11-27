package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.service.CityService;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/adminPage"})
public class AdminPageController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            RequestDispatcher rd=request.getServletContext().getRequestDispatcher("/admin/view/admin-home.jsp");
            rd.forward(request,response);

    }

}
