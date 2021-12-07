package com.proj.bookingapp.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Temporal(TemporalType.DATE)
    private Date checkInDate;
    @Temporal(TemporalType.DATE)
    private Date checkOutDate;
    private double priceForStay;

    @Temporal(TemporalType.DATE)
    private Date cancelDate;

    private int quantityPeople;

    @Basic
    private LocalDateTime  bookingDate;

    @ManyToOne(cascade = {CascadeType.MERGE,CascadeType.PERSIST})
    private User user;

    @OneToOne(cascade = CascadeType.ALL)
    private Transaction transaction;

    @ManyToOne(cascade = {CascadeType.MERGE,CascadeType.PERSIST})
    private Room room;

}
