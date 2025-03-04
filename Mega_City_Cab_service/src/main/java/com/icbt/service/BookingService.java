package com.icbt.service;

import com.icbt.dao.BookingDAO;
import com.icbt.model.Booking;

import java.sql.SQLException;
import java.util.List;

public class BookingService {

    private static BookingService instance;
    private BookingDAO bookingDAO;

    // Private constructor to prevent direct instantiation
    private BookingService() {
        this.bookingDAO = new BookingDAO();
    }

    // Singleton instance method
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

    // Add booking
    public void addBooking(Booking booking) throws SQLException {
        bookingDAO.addBooking(booking);
    }

    // Get all bookings
    public List<Booking> getAllBookings() throws SQLException {
        return bookingDAO.getAllBookings();
    }

    // Get booking by booking number
    public Booking getBookingByBookingNumber(int bookingNumber) throws SQLException {
        return bookingDAO.getBookingByBookingNumber(bookingNumber);
    }

    // Update booking
    public void updateBooking(Booking booking) throws SQLException {
        bookingDAO.updateBooking(booking);
    }

    // Delete booking
    public void deleteBooking(int bookingNumber) throws SQLException {
        bookingDAO.deleteBooking(bookingNumber);
    }

}
