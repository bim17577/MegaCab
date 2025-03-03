package com.icbt.service;

import java.sql.SQLException;
import java.util.List;
import com.icbt.dao.BookingDAO;
import com.icbt.model.Booking;

public class BookingService {

    private static BookingService instance;
    private BookingDAO bookingDAO;

    private BookingService() {
        this.bookingDAO = new BookingDAO();
    }

    // Singleton pattern to ensure only one instance of the service
    public static BookingService getInstance() {
        if (instance == null) {
            synchronized (BookingService.class) {
                if (instance == null) {
                    instance = new BookingService();
                }
            }
        }
        return instance;
    }

    // Method to add a booking
    public void addBooking(Booking booking) throws SQLException {
        if (booking == null) {
            throw new IllegalArgumentException("Booking cannot be null.");
        }
        bookingDAO.addBooking(booking);
    }

    // Method to get all bookings
    public List<Booking> getAllBookings() throws SQLException {
        return bookingDAO.getAllBookings();
    }

    // Method to delete a booking by booking number
    public void deleteBooking(int bookingNumber) throws SQLException {
        if (bookingNumber <= 0) {
            throw new IllegalArgumentException("Invalid booking number.");
        }
        bookingDAO.deleteBooking(bookingNumber);
    }

    // Method to get a booking by booking number
    public Booking getBookingByBookingNumber(int bookingNumber) throws SQLException {
        if (bookingNumber <= 0) {
            throw new IllegalArgumentException("Invalid booking number.");
        }
        return bookingDAO.getBookingByBookingNumber(bookingNumber);
    }

    // Method to update a booking
    public void updateBooking(Booking booking) throws SQLException {
        if (booking == null || booking.getBookingNumber() <= 0) {
            throw new IllegalArgumentException("Invalid booking or booking number.");
        }
        bookingDAO.updateBooking(booking);  // Call the DAO to handle the update
    }
}
