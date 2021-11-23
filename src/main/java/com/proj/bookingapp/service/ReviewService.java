package com.proj.bookingapp.service;

import com.proj.bookingapp.model.Review;

import java.util.List;

public interface ReviewService {
    List<Review> findAll();
    void saveReview(Review review);
    Review findById(Long id);
    void deleteReview(Long id);
    List<Review> findReviewByRoom(Long idRoom);
}
