package com.icbt.controller;

import com.icbt.model.Booking;
import com.icbt.service.BookingService;
import java.sql.Timestamp;

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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listBookings(request, response);
            } else {
                switch (action) {
                    case "add":
                        showAddForm(request, response);
                        break;
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteBooking(request, response);
                        break;
                    case "view":
                        viewBooking(request, response);
                        break;
                    default:
                        listBookings(request, response);
                        break;
                }
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                addBooking(request, response);
            } else if ("update".equals(action)) {
                updateBooking(request, response);
            } else {
                listBookings(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // List all bookings
    private void listBookings(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Booking> bookings = bookingService.getAllBookings();
            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("/WEB-INF/view/AdminDashboard/bookingdetails.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Error retrieving bookings: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // Show the add form
    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/booking.jsp").forward(request, response);
    }

    // Show the edit form
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingNumberStr = request.getParameter("bookingNumber");

        if (bookingNumberStr == null || bookingNumberStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Booking Number is required for editing!");
            return;
        }

        try {
            int bookingNumber = Integer.parseInt(bookingNumberStr);
            Booking booking = bookingService.getBookingByBookingNumber(bookingNumber);
            if (booking != null) {
                request.setAttribute("booking", booking);
                request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/booking.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Booking not found!");
            }
        } catch (NumberFormatException | SQLException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Booking Number format!");
        }
    }

    // Add a new booking
    private void addBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            int carId = Integer.parseInt(request.getParameter("carId"));
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            String pickupLocation = request.getParameter("pickupLocation");
            String destination = request.getParameter("destination");
            double distance = Double.parseDouble(request.getParameter("distance"));
            String status = request.getParameter("status");
            String carType = request.getParameter("carType");
            String paymentMethod = request.getParameter("paymentMethod");
          

            Booking booking = new Booking(customerId, carId, driverId, pickupLocation, destination, distance, status, carType, paymentMethod);
            bookingService.addBooking(booking);

            response.sendRedirect("booking?action=list");
        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            showAddForm(request, response);
        }
    }

 // Update an existing booking
    private void updateBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingNumberStr = request.getParameter("bookingNumber");

        if (bookingNumberStr == null || bookingNumberStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Booking Number is required for update!");
            return;
        }

        try {
            int bookingNumber = Integer.parseInt(bookingNumberStr);
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            int carId = Integer.parseInt(request.getParameter("carId"));
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            String pickupLocation = request.getParameter("pickupLocation");
            String destination = request.getParameter("destination");
            double distance = Double.parseDouble(request.getParameter("distance"));
            String status = request.getParameter("status");
            String carType = request.getParameter("carType");
            String paymentMethod = request.getParameter("paymentMethod");
         

            // Create a Timestamp for the booking date (current time)
            Timestamp bookingDate = new Timestamp(System.currentTimeMillis());

            // Create a new Booking object with the updated details
            Booking booking = new Booking(bookingNumber, customerId, carId, driverId, pickupLocation, 
                                          destination, distance, status, carType, paymentMethod, bookingDate);

            // Update the booking using the booking service
            bookingService.updateBooking(booking);

            // Redirect to the booking list page
            response.sendRedirect("booking?action=list");
        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // Delete a booking
    private void deleteBooking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingNumberStr = request.getParameter("bookingNumber");

        if (bookingNumberStr == null || bookingNumberStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Booking Number is required for deletion!");
            return;
        }

        try {
            int bookingNumber = Integer.parseInt(bookingNumberStr);
            bookingService.deleteBooking(bookingNumber);
            response.sendRedirect("booking?action=list");
        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // View a specific booking
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
        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }
}
