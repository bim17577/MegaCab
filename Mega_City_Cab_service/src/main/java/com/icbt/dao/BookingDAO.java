package com.icbt.dao;

import com.icbt.model.Booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    // Add a new booking to the database
    public void addBooking(Booking booking) {
        String query = "INSERT INTO Booking (customer_id, car_id, driver_id, pickup_location, destination, distance, status, carType, paymentMethod) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, booking.getCustomerId());
            statement.setInt(2, booking.getCarId());
            statement.setInt(3, booking.getDriverId());
            statement.setString(4, booking.getPickupLocation());
            statement.setString(5, booking.getDestination());
            statement.setDouble(6, booking.getDistance());
            statement.setString(7, booking.getStatus());
            statement.setString(8, booking.getCarType());  // Add carType
            statement.setString(9, booking.getPaymentMethod()); // Add paymentMethod

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Close the database resources
    private void closeResources(ResultSet rs, PreparedStatement stmt, Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get all bookings from the database
    public List<Booking> getAllBookings() throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM Booking";

        try (Connection connection = DBConnection.getInstance().getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int bookingNumber = resultSet.getInt("booking_number");
                int customerId = resultSet.getInt("customer_id");
                int carId = resultSet.getInt("car_id");
                int driverId = resultSet.getInt("driver_id");
                String pickupLocation = resultSet.getString("pickup_location");
                String destination = resultSet.getString("destination");
                double distance = resultSet.getDouble("distance");
                String status = resultSet.getString("status");
                String carType = resultSet.getString("carType");  // Retrieve carType
                String paymentMethod = resultSet.getString("paymentMethod"); // Retrieve paymentMethod

                bookings.add(new Booking(bookingNumber, customerId, carId, driverId, pickupLocation, destination, distance, status, carType, paymentMethod));
            }
        }
        return bookings;
    }

    // Delete a booking by booking number
    public void deleteBooking(int bookingNumber) throws SQLException {
        String query = "DELETE FROM Booking WHERE booking_number = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, bookingNumber);
            statement.executeUpdate();
        }
    }

    // Get a booking by booking number
    public Booking getBookingByBookingNumber(int bookingNumber) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getInstance().getConnection();
            String sql = "SELECT booking_number, customer_id, car_id, driver_id, pickup_location, destination, distance, status, carType, paymentMethod FROM Booking WHERE booking_number = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, bookingNumber);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int customerId = rs.getInt("customer_id");
                int carId = rs.getInt("car_id");
                int driverId = rs.getInt("driver_id");
                String pickupLocation = rs.getString("pickup_location");
                String destination = rs.getString("destination");
                double distance = rs.getDouble("distance");
                String status = rs.getString("status");
                String carType = rs.getString("carType");  // Retrieve carType
                String paymentMethod = rs.getString("paymentMethod"); // Retrieve paymentMethod

                return new Booking(bookingNumber, customerId, carId, driverId, pickupLocation, destination, distance, status, carType, paymentMethod);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, stmt, conn);
        }
        return null;
    }

    // Update a booking in the database
    public void updateBooking(Booking booking) throws SQLException {
        String updateSQL = "UPDATE Booking SET customer_id = ?, car_id = ?, driver_id = ?, pickup_location = ?, destination = ?, distance = ?, status = ?, carType = ?, paymentMethod = ? WHERE booking_number = ?";

        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(updateSQL)) {

            preparedStatement.setInt(1, booking.getCustomerId());
            preparedStatement.setInt(2, booking.getCarId());
            preparedStatement.setInt(3, booking.getDriverId());
            preparedStatement.setString(4, booking.getPickupLocation());
            preparedStatement.setString(5, booking.getDestination());
            preparedStatement.setDouble(6, booking.getDistance());
            preparedStatement.setString(7, booking.getStatus());
            preparedStatement.setString(8, booking.getCarType());  // Add carType
            preparedStatement.setString(9, booking.getPaymentMethod()); // Add paymentMethod
            preparedStatement.setInt(10, booking.getBookingNumber());

            preparedStatement.executeUpdate(); // Execute the update query
        }
    }
}
