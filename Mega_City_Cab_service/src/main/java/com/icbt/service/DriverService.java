package com.icbt.service;

import com.icbt.dao.DriverDAO;
import com.icbt.model.Driver;

import java.sql.SQLException;
import java.util.List;

public class DriverService {

    private static DriverService instance;
    private DriverDAO driverDAO;

    // Private constructor to prevent direct instantiation
    private DriverService() {
        this.driverDAO = new DriverDAO();
    }

    // Singleton instance method
    public static DriverService getInstance() {
        if (instance == null) {
            synchronized (DriverService.class) {
                if (instance == null) {
                    instance = new DriverService();
                }
            }
        }
        return instance;
    }

    // Add driver
    public void addDriver(Driver driver) throws SQLException {
        driverDAO.addDriver(driver);
    }

    // Get all drivers
    public List<Driver> getAllDrivers() throws SQLException {
        return driverDAO.getAllDrivers();
    }

    // Get driver by ID
    public Driver getDriverById(int driverId) throws SQLException {
        return driverDAO.getDriverById(driverId);
    }

    // Update driver
    public void updateDriver(Driver driver) throws SQLException {
        driverDAO.updateDriver(driver);
    }

    // Delete driver
    public void deleteDriver(int driverId) throws SQLException {
        driverDAO.deleteDriver(driverId);
    }

}
