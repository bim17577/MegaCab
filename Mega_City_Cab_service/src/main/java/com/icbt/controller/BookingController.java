package com.icbt.controller;

import com.icbt.dao.BookingDAO;
import com.icbt.model.Booking;
import com.icbt.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;

    public void init() throws ServletException {
        bookingService = BookingService.getInstance();
    }

    // Handle the booking-related POST request (add a booking)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addBooking(request, response);
        } else {
            doGet(request, response);
        }
    }

    // Handle the booking-related GET request (list bookings, view details, etc.)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("view".equals(action)) {
            viewBooking(request, response);
        } else if ("list".equals(action)) {
            listBookings(request, response);
        } else if ("add".equals(action)) {
            showAddBookingForm(request, response);
        } else {
            showBookingHome(request, response);
        }
    }

    // View booking details
    private void viewBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int bookingNumber = Integer.parseInt(request.getParameter("bookingNumber"));
            Booking booking = bookingService.getBookingByBookingNumber(bookingNumber);
            if (booking != null) {
                request.setAttribute("booking", booking);
                request.getRequestDispatcher("WEB-INF/view/AdminDashboard/bookingdetails.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Booking not found.");
                request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid booking number format.");
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // List all bookings
    private void listBookings(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Booking> bookingList = bookingService.getAllBookings();
            request.setAttribute("bookings", bookingList);
            request.getRequestDispatcher("WEB-INF/view/AdminDashboard/bookingdetails.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // Show the booking creation form
    private void showAddBookingForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/CustomerDashboard/booking.jsp").forward(request, response);
    }

    // Add a new booking
    private void addBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Extract parameters from the request
            int bookingNumber = Integer.parseInt(request.getParameter("bookingNumber"));
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            int carId = Integer.parseInt(request.getParameter("carId"));
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            String pickupLocation = request.getParameter("pickupLocation");
            String destination = request.getParameter("destination");
            double distance = Double.parseDouble(request.getParameter("distance"));
            String status = request.getParameter("status");
            String carType = request.getParameter("carType");
            String paymentMethod = request.getParameter("paymentMethod");

            // Create a new Booking object using the constructor with all required parameters
            Booking booking = new Booking(bookingNumber, customerId, carId, driverId, pickupLocation, destination, distance, status, carType, paymentMethod);
            
            // Call the service to add the booking
            bookingService.addBooking(booking);

            // Redirect to the booking list page after successful booking
            response.sendRedirect("booking?action=list");

        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/CustomerDashboard/booking.jsp").forward(request, response);
        }
    }


    // Show the home page or default view
    private void showBookingHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/BookingDashboard/bookingHome.jsp").forward(request, response);
    }
}
