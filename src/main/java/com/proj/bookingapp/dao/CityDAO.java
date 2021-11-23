package com.proj.bookingapp.dao;

import com.proj.bookingapp.model.City;

import java.util.List;

public interface CityDAO {
    List<City> findAll();
    void saveCity(City city);
    City findById(Long id);
    void deleteCity(Long id);
    int getTotalCity();
}
