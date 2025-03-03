package com.icbt.dao;

import com.icbt.model.Car;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDAO {

    // Get all cars
    public List<Car> getAllCars() throws SQLException {
        List<Car> cars = new ArrayList<>();
        String query = "SELECT * FROM car";

        try (Connection connection = DBConnection.getInstance().getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int carId = resultSet.getInt("car_id");
                String carModel = resultSet.getString("car_model");
                String carType = resultSet.getString("car_type");
                double farePerKm = resultSet.getDouble("fare_per_km");

                cars.add(new Car(carId, carModel, carType, farePerKm));
            }
        }
        return cars;
    }

    // Get a single car by ID
    public Car getCarById(int carId) throws SQLException {
        if (carId <= 0) {
            throw new IllegalArgumentException("Invalid Car ID format!");
        }
        
        String query = "SELECT * FROM car WHERE car_id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, carId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Car(
                        rs.getInt("car_id"),
                        rs.getString("car_model"),
                        rs.getString("car_type"),
                        rs.getDouble("fare_per_km")
                    );
                }
            }
        }
        return null; // Return null if no car is found
    }

    // Add a new car
    public void addCar(Car car) {
        // Ensure car ID is not provided for a new car (should be 0)
        if (car.getCarId() != 0) {
            throw new IllegalArgumentException("Car ID should not be provided for a new car!");
        }

        String query = "INSERT INTO car (car_model, car_type, fare_per_km) VALUES (?, ?, ?)";

        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            statement.setString(1, car.getCarModel());
            statement.setString(2, car.getCarType());
            statement.setDouble(3, car.getFarePerKm());

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                // Retrieve the generated carId
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        car.setCarId(generatedKeys.getInt(1));  // Set the auto-generated carId
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update an existing car (keeping the same car ID)
    public boolean updateCar(Car car) throws SQLException {
        // Ensure carId exists and is valid
        if (car.getCarId() <= 0) {
            throw new IllegalArgumentException("Invalid Car ID format!");
        }

        String query = "UPDATE car SET car_model = ?, car_type = ?, fare_per_km = ? WHERE car_id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, car.getCarModel());
            stmt.setString(2, car.getCarType());
            stmt.setDouble(3, car.getFarePerKm());
            stmt.setInt(4, car.getCarId());

            return stmt.executeUpdate() > 0; // returns true if update was successful
        }
    }

    // Delete a car
    public boolean deleteCar(int carId) throws SQLException {
        if (carId <= 0) {
            throw new IllegalArgumentException("Invalid Car ID format!");
        }

        String query = "DELETE FROM car WHERE car_id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, carId);
            return stmt.executeUpdate() > 0;
        }
    }
}
