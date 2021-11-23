package com.proj.bookingapp.service;

import com.proj.bookingapp.model.Building;

import java.util.List;

public interface BuildingService {
    List<Building> findAll();
    void saveBuilding(Building building);
    Building findById(Long id);
    void deleteBuilding(Long id);
}
