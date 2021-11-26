package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.model.City;
import com.proj.bookingapp.service.CityService;
import com.proj.bookingapp.service.iplm.CityServiceIplm;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/adminPage/city"})
public class CityController extends HttpServlet {


    private CityService cityService= new CityServiceIplm();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null) action="load";
        switch (action){
            case "load":
                loadCity(request,response);
                break;
            case "add":
                addCity(request,response);
                break;
            case "delete":
                deleteCity(request,response);
                break;
            case "update":

            default:
                loadCity(request,response);
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    private void deleteCity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Long id = Long.valueOf(request.getParameter("id"));
        cityService.deleteCity(id);
        response.sendRedirect("city");
    }

    private void loadCity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        List<City> cities = new ArrayList<>();
        cities= cityService.findAll();
        request.setAttribute("cities",cities);
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/cityview.jsp");
        rd.forward(request,response);
    }
    private void addCity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String cityName = request.getParameter("cityname");
        System.out.println(cityName);

        cityService.saveCity(new City(null,cityName,new ArrayList<>()));

        response.sendRedirect("city");
    }
}
