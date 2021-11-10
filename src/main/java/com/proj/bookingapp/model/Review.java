package com.proj.bookingapp.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Lob
    private String comment;

    private int rate;

    @ManyToOne(fetch = FetchType.EAGER)
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    private Room room;

    private void addReview(User tempuser, Room temprooms){
        user=tempuser;
        if (tempuser.getReviews().equals(null)) tempuser.setReviews(new ArrayList<>());
        tempuser.getReviews().add(this);
        room =temprooms;
        if (temprooms.getReviews().equals(null)) temprooms.setReviews(new ArrayList<>());
        temprooms.getReviews().add(this);
    }

}

