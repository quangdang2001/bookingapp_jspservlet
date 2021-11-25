package com.proj.bookingapp.utils;

import com.proj.bookingapp.model.Booking;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateUtil {
    public static List<String> getBlockDate(List<Booking> bookings){
        List<String> dateBlock= new ArrayList<>();
        Calendar calendar = Calendar.getInstance();

        if(bookings!=null){
            for (Booking booking : bookings){

                calendar.setTime(booking.getCheckInDate());
                String date1 = calendar.get(Calendar.YEAR)+"-"+ (calendar.get(Calendar.MONTH) + 1) +"-"+ calendar.get(Calendar.DAY_OF_MONTH);
                calendar.setTime(booking.getCheckOutDate());
                String date2 = calendar.get(Calendar.YEAR)+"-"+(calendar.get(Calendar.MONTH) + 1)+"-"+ calendar.get(Calendar.DAY_OF_MONTH);

                dateBlock.add("[\""+date1+"\",\""+date2+"\"]");

            }
            return dateBlock;
        }
        return dateBlock;
    }
}
