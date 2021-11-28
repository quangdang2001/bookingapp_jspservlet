package com.proj.bookingapp.dto;


import com.proj.bookingapp.model.Room;
import com.proj.bookingapp.model.Transaction;

import com.proj.bookingapp.model.User;
import lombok.AllArgsConstructor;
import lombok.Data;


import java.util.Date;

@Data @AllArgsConstructor
public class BookingDTO {

    private Long id;

    private Date checkInDate;

    private Date checkOutDate;

    private double priceForStay;

    private int quantityPeople;

    private String bookingDate;

    private Transaction transaction;

    private Room room;
    private User user;
    private Date cancelDate;
}
