package com.proj.bookingapp.service.iplm;

import com.proj.bookingapp.dao.BuildingDAO;
import com.proj.bookingapp.dao.iplm.BuildingDAOIplm;
import com.proj.bookingapp.model.Building;
import com.proj.bookingapp.service.BuildingService;

import java.util.List;

public class BuildingServiceIplm implements BuildingService {
    private final BuildingDAO buildingDAO;

    public BuildingServiceIplm() {
        this.buildingDAO = new BuildingDAOIplm();
    }

    @Override
    public List<Building> findAll() {
        return buildingDAO.findAll();
    }

    @Override
    public void saveBuilding(Building building) {
        buildingDAO.saveBuilding(building);
    }

    @Override
    public Building findById(Long id) {
        return buildingDAO.findById(id);
    }

    @Override
    public void deleteBuilding(Long id) {
        buildingDAO.deleteBuilding(id);
    }
}
