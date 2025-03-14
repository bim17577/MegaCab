package com.icbt.controller;
import javax.servlet.http.HttpSession;

import com.icbt.service.CarService;
import com.icbt.service.DriverService;
import com.icbt.model.Booking;
import com.icbt.model.Car;
import com.icbt.model.Driver;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class DriverController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DriverService driverService;
    

    public void init() throws ServletException {
        driverService = DriverService.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listDrivers(request, response);
            } else {
                switch (action) {
                    case "add":
                        showAddForm(request, response);
                        break;
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteDriver(request, response);
                        break;
                    case "view":
                        viewDriver(request, response);
                        break;
                    default:
                        listDrivers(request, response);
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
                addDriver(request, response);
            } else if ("update".equals(action)) {
                updateDriver(request, response);
            } else {
                // If no valid action, list drivers
                listDrivers(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // List all drivers
    private void listDrivers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Driver> drivers = driverService.getAllDrivers();
            request.setAttribute("drivers", drivers);
            request.getRequestDispatcher("/WEB-INF/view/AdminDashboard/driverdetails.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Error retrieving drivers: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // Show the add form
    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/driver.jsp").forward(request, response);
    }

    // Show the edit form
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverIdStr = request.getParameter("driverId");

        if (driverIdStr == null || driverIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Driver ID is required for editing!");
            return;
        }

        try {
            int driverId = Integer.parseInt(driverIdStr);
            Driver driver = driverService.getDriverById(driverId);
            if (driver != null) {
                request.setAttribute("driver", driver);
                request.getRequestDispatcher("/WEB-INF/view/AdminDashboard/editDriver.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Driver not found!");
            }
        } catch (NumberFormatException | SQLException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Driver ID format!");
        }
    }
    
    
    
    
    
    
    
   

    // Add a new driver
    private void addDriver(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverName = request.getParameter("driverName");
        String phoneNumber = request.getParameter("phone_number");
        String licenseNumber = request.getParameter("license_number");
        String carIdStr = request.getParameter("car_id");

        // Get customerId from session
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customerId");

        // Log the customer ID to check if it's correctly set
        System.out.println("Customer ID in session: " + customerId);

        if (customerId == null) {
            // If customerId is null, that means the session has expired or customer is not logged in
            request.setAttribute("errorMessage", "Customer ID is missing. Please log in first.");
            showAddForm(request, response);  // This could be a method to show the form again or redirect to login
            return;
        }

        // Validate inputs
        if (driverName == null || driverName.trim().isEmpty() || carIdStr == null || carIdStr.trim().isEmpty()) {
            request.setAttribute("error", "Driver Name and Car ID are required!");
            showAddForm(request, response);
            return;
        }

        try {
            int carId = Integer.parseInt(carIdStr);

            // Create a new driver object
            Driver newDriver = new Driver(0, driverName, phoneNumber, licenseNumber, carId);
            driverService.addDriver(newDriver); // Add the driver without customerId

            int driverId = newDriver.getDriverId();

            // Redirect with carId, driverId, and customerId
            response.sendRedirect("booking?action=add&carId=" + carId + "&driverId=" + driverId + "&customerId=" + customerId);


        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            showAddForm(request, response);
        }
    }




    // Update an existing driver
    private void updateDriver(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverIdStr = request.getParameter("driverId");

        if (driverIdStr == null || driverIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Driver ID is required for update!");
            return;
        }

        try {
            int driverId = Integer.parseInt(driverIdStr);
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phoneNumber");
            String licenseNumber = request.getParameter("licenseNumber");
            int carId = Integer.parseInt(request.getParameter("carId"));

            Driver driver = new Driver(driverId, name, phoneNumber, licenseNumber, carId);
            driverService.updateDriver(driver);

            response.sendRedirect("driver?action=list");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Driver ID or Car ID format!");
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }
    
    
  
    private void viewDriver(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            Driver driver = driverService.getDriverById(driverId);
            if (driver != null) {
                request.setAttribute("driver", driver);
                request.getRequestDispatcher("WEB-INF/view/AdminDashboard/viewDriver.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Driver not found.");
                request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
            }
        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }


    // Delete a driver
    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverIdStr = request.getParameter("driverId");

        if (driverIdStr == null || driverIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Driver ID is required for deletion!");
            return;
        }

        try {
            int driverId = Integer.parseInt(driverIdStr);
            driverService.deleteDriver(driverId);
            response.sendRedirect("driver?action=list");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Driver ID format!");
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }
}
