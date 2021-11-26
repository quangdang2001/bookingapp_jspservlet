package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.model.City;
import com.proj.bookingapp.model.Payment;
import com.proj.bookingapp.service.CityService;
import com.proj.bookingapp.service.PaymentService;
import com.proj.bookingapp.service.iplm.PaymentServiceIplm;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/adminPage/payment"})
public class PaymentController extends HttpServlet {

    private PaymentService paymentService= new PaymentServiceIplm();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null) action="load";
        switch (action){
            case "load":
                loadPayment(request,response);
                break;
            case "add":
                addPayment(request,response);
                break;
            case "delete":
                deletePayment(request,response);
                break;
            case "update":

            default:
                loadPayment(request,response);
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    private void deletePayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Long id =  Long.parseLong(request.getParameter("id"));
        paymentService.deletePayment(id);
        response.sendRedirect("payment");
    }

    private void loadPayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        List<Payment> payments = new ArrayList<>();
        payments= paymentService.findAll();
        request.setAttribute("payments",payments);
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/paymentview.jsp");
        rd.forward(request,response);
    }
    private void addPayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String paymentName = request.getParameter("paymentname");
        System.out.println(paymentName);
        paymentService.savePayment(new Payment(null,paymentName));

        response.sendRedirect("payment");
    }
}
