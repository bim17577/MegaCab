package com.icbt.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.icbt.model.Driver;

public class DriverDAO {

    // Add a new driver
	public void addDriver(Driver driver) throws SQLException {
	    if (driver.getCarId() == 0) {
	        throw new IllegalArgumentException("Car ID cannot be 0.");
	    }

	    // Add the driver to the database with the assigned car_id
	    String query = "INSERT INTO Driver (name, phone_number, license_number, car_id) VALUES (?, ?, ?, ?)";
	    try (Connection connection = DBConnection.getInstance().getConnection();
	         PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

	        statement.setString(1, driver.getName());
	        statement.setString(2, driver.getPhoneNumber());
	        statement.setString(3, driver.getLicenseNumber());
	        statement.setInt(4, driver.getCarId());  // Use the car_id here

	        // Execute the query and check for successful insertion
	        int affectedRows = statement.executeUpdate();
	        if (affectedRows > 0) {
	            ResultSet generatedKeys = statement.getGeneratedKeys();
	            if (generatedKeys.next()) {
	                driver.setDriverId(generatedKeys.getInt(1));  // Set the generated driver ID
	            }
	        } else {
	            throw new SQLException("Driver insertion failed, no rows affected.");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new SQLException("Error inserting driver into database: " + e.getMessage());
	    }
	}


    // Get all drivers
    public List<Driver> getAllDrivers() throws SQLException {
        List<Driver> drivers = new ArrayList<>();
        String query = "SELECT * FROM Driver";

        try (Connection connection = DBConnection.getInstance().getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int driverId = resultSet.getInt("driver_id");
                String name = resultSet.getString("name");
                String phoneNumber = resultSet.getString("phone_number");
                String licenseNumber = resultSet.getString("license_number");
                int carId = resultSet.getInt("car_id");

                drivers.add(new Driver(driverId, name, phoneNumber, licenseNumber, carId));
            }
        }
        return drivers;
    }

    // Get driver by ID
    public Driver getDriverById(int driverId) throws SQLException {
        if (driverId <= 0) {
            throw new IllegalArgumentException("Invalid Driver ID format!");
        }
        
        String query = "SELECT * FROM Driver WHERE driver_id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, driverId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Driver(
                        rs.getInt("driver_id"),
                        rs.getString("name"),
                        rs.getString("phone_number"),
                        rs.getString("license_number"),
                        rs.getInt("car_id")
                    );
                }
            }
        }
        return null;
    }

    // Update a driver's information
    public boolean updateDriver(Driver driver) throws SQLException {
        // Ensure driverId exists and is valid
        if (driver.getDriverId() <= 0) {
            throw new IllegalArgumentException("Invalid Driver ID format!");
        }

        String query = "UPDATE Driver SET name = ?, phone_number = ?, license_number = ?, car_id = ? WHERE driver_id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, driver.getName());
            stmt.setString(2, driver.getPhoneNumber());
            stmt.setString(3, driver.getLicenseNumber());
            stmt.setInt(4, driver.getCarId());
            stmt.setInt(5, driver.getDriverId());

            return stmt.executeUpdate() > 0; // returns true if update was successful
        }
    }


    // Delete a driver
    public boolean deleteDriver(int driverId) throws SQLException {
        if (driverId <= 0) {
            throw new IllegalArgumentException("Invalid Driver ID format!");
        }

        String query = "DELETE FROM Driver WHERE driver_id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, driverId);
            return stmt.executeUpdate() > 0;
        }
    }
}
