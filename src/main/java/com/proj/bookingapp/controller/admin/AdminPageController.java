package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.service.CityService;

import javax.inject.Inject;
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
        String object = request.getParameter("object");
        if (object==null) {
            RequestDispatcher rd=request.getServletContext().getRequestDispatcher("/admin/view/admin-home.jsp");
            rd.forward(request,response);
        };
        switch (object){
            case "city":
                cityObject(request,response);
                break;
            case "payment":
                paymentObject(request,response);
                break;
            case "roomtype":
                roomTypeObject(request,response);
                break;
            default:
                System.out.println("default");
        }
    }
    private void roomTypeObject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        RequestDispatcher rd=request.getServletContext().getRequestDispatcher("/adminPage/roomtype");
        rd.forward(request,response);
    }
    private void paymentObject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        RequestDispatcher rd=request.getServletContext().getRequestDispatcher("/adminPage/payment");
        rd.forward(request,response);
    }
    private void cityObject(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        RequestDispatcher rd=request.getServletContext().getRequestDispatcher("/adminPage/city");
        rd.forward(request,response);
    }
}
