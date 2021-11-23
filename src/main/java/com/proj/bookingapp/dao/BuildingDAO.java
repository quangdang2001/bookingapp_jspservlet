package com.proj.bookingapp.dao;

import com.proj.bookingapp.model.Building;
import com.proj.bookingapp.model.Payment;

import java.util.List;

public interface BuildingDAO {
    List<Building> findAll();
    void saveBuilding(Building building);
    Building findById(Long id);
    void deleteBuilding(Long id);
}
