package com.icbt.dao;

import com.icbt.model.Booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    // Add a new booking to the database
	public void addBooking(Booking booking) throws SQLException {
	    // Check if bookingDate is null, assign current timestamp if so
	    if (booking.getBookingDate() == null) {
	        booking.setBookingDate(new Timestamp(System.currentTimeMillis())); // Set current time if null
	    }

	    String query = "INSERT INTO Booking (customer_id, car_id, driver_id, pickup_location, destination, distance, status, payment_method, booking_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    try (Connection connection = DBConnection.getInstance().getConnection();
	         PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

	        statement.setInt(1, booking.getCustomerId());
	        statement.setInt(2, booking.getCarId());
	        statement.setInt(3, booking.getDriverId());
	        statement.setString(4, booking.getPickupLocation());
	        statement.setString(5, booking.getDestination());
	        statement.setDouble(6, booking.getDistance());
	        statement.setString(7, booking.getStatus());
	        statement.setString(8, booking.getPaymentMethod());
	        statement.setTimestamp(9, booking.getBookingDate()); // Correct index for bookingDate

	        int affectedRows = statement.executeUpdate();
	        if (affectedRows > 0) {
	            ResultSet generatedKeys = statement.getGeneratedKeys();
	            if (generatedKeys.next()) {
	                booking.setBookingNumber(generatedKeys.getInt(1)); // Set the generated booking number
	            }
	        } else {
	            throw new SQLException("Booking insertion failed, no rows affected.");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw new SQLException("Error inserting booking into database: " + e.getMessage());
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
                String paymentMethod = resultSet.getString("payment_method");  // Corrected column name
                Timestamp bookingDate = resultSet.getTimestamp("booking_date");  // Correct column name

                bookings.add(new Booking(bookingNumber, customerId, carId, driverId, pickupLocation, destination, distance, status, paymentMethod, bookingDate));
            }
        }
        return bookings;
    }

    // Get a booking by booking number
    public Booking getBookingByBookingNumber(int bookingNumber) throws SQLException {
        if (bookingNumber <= 0) {
            throw new IllegalArgumentException("Invalid Booking Number format!");
        }

        String query = "SELECT * FROM Booking WHERE booking_number = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, bookingNumber);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new Booking(
                            resultSet.getInt("booking_number"),
                            resultSet.getInt("customer_id"),
                            resultSet.getInt("car_id"),
                            resultSet.getInt("driver_id"),
                            resultSet.getString("pickup_location"),
                            resultSet.getString("destination"),
                            resultSet.getDouble("distance"),
                            resultSet.getString("status"),
                            resultSet.getString("payment_method"),  // Corrected column name
                            resultSet.getTimestamp("booking_date")  // Correct column name
                    );
                }
            }
        }
        return null;
    }

    // Update a booking in the database
    public boolean updateBooking(Booking booking) throws SQLException {
        if (booking.getBookingNumber() <= 0) {
            throw new IllegalArgumentException("Invalid Booking Number format!");
        }

        String query = "UPDATE Booking SET customer_id = ?, car_id = ?, driver_id = ?, pickup_location = ?, destination = ?, distance = ?, status = ?, payment_method = ?, booking_date = ? WHERE booking_number = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, booking.getCustomerId());
            statement.setInt(2, booking.getCarId());
            statement.setInt(3, booking.getDriverId());
            statement.setString(4, booking.getPickupLocation());
            statement.setString(5, booking.getDestination());
            statement.setDouble(6, booking.getDistance());
            statement.setString(7, booking.getStatus());
            statement.setString(8, booking.getPaymentMethod());  // Corrected column name
            statement.setTimestamp(9, booking.getBookingDate());
            statement.setInt(10, booking.getBookingNumber());

            return statement.executeUpdate() > 0;
        }
    }

    // Delete a booking by booking number
    public boolean deleteBooking(int bookingNumber) throws SQLException {
        if (bookingNumber <= 0) {
            throw new IllegalArgumentException("Invalid Booking Number format!");
        }

        String query = "DELETE FROM Booking WHERE booking_number = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, bookingNumber);
            return statement.executeUpdate() > 0;
        }
    }
}
