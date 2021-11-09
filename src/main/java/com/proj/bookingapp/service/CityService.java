package com.proj.bookingapp.service;

import com.proj.bookingapp.model.City;

import java.util.List;

public interface CityService {
    List<City> findAll();
    void saveCity(City city);
    City findById(Long id);
    void deleteCity(Long id);
    int getTotalCity();
}
