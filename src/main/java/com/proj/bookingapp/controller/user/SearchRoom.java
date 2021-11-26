package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.model.City;
import com.proj.bookingapp.model.Room;
import com.proj.bookingapp.service.RoomService;
import com.proj.bookingapp.service.iplm.RoomServiceIplm;
import lombok.SneakyThrows;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/home/rooms"})
public class SearchRoom extends HttpServlet {

    private RoomService roomService= new RoomServiceIplm();

    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("search")) loadRooms(request,response);
        if (action.equals("filter")) filterRoom(request,response);
    }

    private void filterRoom(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {


        List<Integer> stars=null;
        HttpSession session = request.getSession();
        List<Room> rooms = (List<Room>) session.getAttribute("ssrooms");
        session.setAttribute("ssrooms",rooms);
        List<Room> rooms2= new ArrayList<>(rooms);
        for (Room room : rooms){
            System.out.println(room.getName());
        }
        String sort = request.getParameter("sortByPrice");
        List<String> roomType;
        if (request.getParameterValues("roomType") == null){
            roomType=null;
        }
        else {
            roomType = List.of(request.getParameterValues("roomType"));
        }

        List<String> star;
        if (request.getParameterValues("star") == null){
            star=null;
        }
        else {
            star = List.of(request.getParameterValues("star"));
        }

        if (star!=null && star.size()>0){
            stars = new ArrayList<>();
            for (String temp :star){
                stars.add(Integer.parseInt(temp));
            }
        }
        String rangePrice = request.getParameter("rangePrice");

        if(rangePrice!=null) {
            if (rangePrice.equals("under_20")) rooms2 = roomService.filterRoom(roomType,stars, (double) 0,19.9,rooms2);
            else
            if (rangePrice.equals("20_to_50")) rooms2 = roomService.filterRoom(roomType,stars, (double) 20,49.9,rooms2);
            else
            if (rangePrice.equals("50_to_100")) rooms2 = roomService.filterRoom(roomType,stars, (double) 50,99.9,rooms2);
            else
            if (rangePrice.equals("100_to_200")) rooms2 = roomService.filterRoom(roomType,stars, (double) 100,199.9,rooms2);
            else
            if (rangePrice.equals("over_200")) rooms2 = roomService.filterRoom(roomType,stars, (double) 200,99999999999.9,rooms2);
        }
        else rooms2 = roomService.filterRoom(roomType,stars, null,null,rooms2);

        if (sort!=null && !sort.equals("")){
            if (sort.equals("low_to_high")) rooms2=roomService.ascendingPriceRoom(rooms2);
            else rooms2=roomService.descendingPriceRoom(rooms2);
        }

        request.setAttribute("rooms",rooms2);
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/product.jsp");
        rd.forward(request,response);
    }

    private void loadRooms(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

        SimpleDateFormat hiberFormat=new SimpleDateFormat("dd/MM/yyyy");
        String destination = request.getParameter("destination");
        System.out.println(destination);
        Date checkInDate = null;
        Date checkOutDate = null;
        HttpSession session = request.getSession();
        String checkIn =request.getParameter("checkInDate");
        String checkOut = request.getParameter("checkOutDate");

        if (!checkIn.equals("") && !checkOut.equals("")){
            checkInDate = hiberFormat.parse(checkIn);
            checkOutDate = hiberFormat.parse(checkOut);
            long totalDay = checkOutDate.getTime() - checkInDate.getTime();
            totalDay = totalDay/(24 * 60 * 60 * 1000);
            session.setAttribute("totalDay",totalDay);
        }
        else {
            session.setAttribute("totalDay",0);
        }

        String quantityPeople = request.getParameter("quantityPeople") +" ";
        System.out.println(quantityPeople);
        quantityPeople = quantityPeople.substring(0,quantityPeople.indexOf(" "));
        Integer quantity = Integer.parseInt(quantityPeople);

        List<Room> rooms = new ArrayList<>();
        rooms = roomService.searchRoom(destination,quantity,checkInDate,checkOutDate);

        request.setAttribute("rooms",rooms);



        session.setAttribute("destination",destination);
        session.setAttribute("checkInDate",request.getParameter("checkInDate"));
        session.setAttribute("checkOutDate",request.getParameter("checkOutDate"));
        session.setAttribute("quantityPeople",quantityPeople);

        session.setAttribute("ssrooms",rooms);
        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/product.jsp");
        rd.forward(request,response);
    }

}
