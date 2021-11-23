package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.ReviewDAO;
import com.proj.bookingapp.dao.iplm.ReviewDAOIplm;
import com.proj.bookingapp.model.Review;
import com.proj.bookingapp.service.ReviewService;

import java.util.List;

public class ReviewServiceIplm implements ReviewService {

    private final ReviewDAO reviewDAO;

    public ReviewServiceIplm() {
        this.reviewDAO = new ReviewDAOIplm();
    }

    @Override
    public List<Review> findAll() {
        return reviewDAO.findAll();
    }

    @Override
    public void saveReview(Review review) {
        reviewDAO.saveReview(review);
    }

    @Override
    public Review findById(Long id) {
        return reviewDAO.findById(id);
    }

    @Override
    public void deleteReview(Long id) {
        reviewDAO.deleteReview(id);
    }

    @Override
    public List<Review> findReviewByRoom(Long idRoom) {
        return reviewDAO.findReviewByRoom(idRoom);
    }
}
