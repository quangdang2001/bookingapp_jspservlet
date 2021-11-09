package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.CityDAO;
import com.proj.bookingapp.dao.iplm.CityDAOIplm;
import com.proj.bookingapp.model.City;
import com.proj.bookingapp.service.CityService;


import java.util.List;


public class CityServiceIplm implements CityService {
    private final   CityDAO cityDAO;

    public CityServiceIplm() {
        this.cityDAO = new CityDAOIplm();
    }

    @Override
    public List<City> findAll() {
        return cityDAO.findAll();
    }

    @Override
    public void saveCity(City city) {
        cityDAO.saveCity(city);
    }

    @Override
    public City findById(Long id) {
        return cityDAO.findById(id);
    }

    @Override
    public void deleteCity(Long id) {
        cityDAO.deleteCity(id);
    }

    @Override
    public int getTotalCity() {
        return cityDAO.getTotalCity();
    }
}
