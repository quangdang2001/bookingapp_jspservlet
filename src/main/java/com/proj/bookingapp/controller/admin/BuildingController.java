package com.proj.bookingapp.controller.admin;

import com.proj.bookingapp.model.Building;
import com.proj.bookingapp.model.City;
import com.proj.bookingapp.model.Room;
import com.proj.bookingapp.model.RoomType;
import com.proj.bookingapp.service.BuildingService;
import com.proj.bookingapp.service.CityService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/adminPage/building"})
public class BuildingController extends HttpServlet {
    @Inject
    private BuildingService buildingService;
    @Inject
    private CityService cityService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

        Building building = buildingService.findById(Long.parseLong(request.getParameter("id")));
        request.setAttribute("building",building);

        List<Building> buildings = buildingService.findAll();
        request.setAttribute("buildings",buildings);

        List<City> cities= cityService.findAll();
        request.setAttribute("cities",cities);
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/buildingview.jsp");
        rd.forward(request,response);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Long id = Long.valueOf(request.getParameter("id"));
        buildingService.deleteBuilding(id);
        response.sendRedirect("building");
    }

    private void load(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        List<Building> buildings = buildingService.findAll();
        List<City> cities= cityService.findAll();

        request.setAttribute("buildings",buildings);
        request.setAttribute("cities",cities);
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/admin/view/buildingview.jsp");
        rd.forward(request,response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String tempId = request.getParameter("id");
        List<Room> rooms= null;
        Long id = null;
        if (!tempId.equals("")){
            id =Long.valueOf(tempId);
            rooms = buildingService.findById(id).getRooms();
        }

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        System.out.println(request.getParameter("city"));
        Long idcity = Long.valueOf(request.getParameter("city"));

        City city = cityService.findById(idcity);
        buildingService.saveBuilding(new Building(id,name,address,city,rooms));

        response.sendRedirect("building");
    }
}
