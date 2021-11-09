package com.proj.bookingapp.dao;

import com.proj.bookingapp.model.Building;
import com.proj.bookingapp.model.Review;

import java.util.List;

public interface ReviewDAO {
    List<Review> findAll();
    void saveReview(Review review);
    Review findById(Long id);
    void deleteReview(Long id);
}
