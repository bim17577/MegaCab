package com.icbt.controller;
import javax.servlet.RequestDispatcher;

import com.icbt.model.Car;
import com.icbt.model.Customer;
import com.icbt.service.CarService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;



public class CarController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CarService carService;

    public void init() throws ServletException {
        carService = CarService.getInstance();
    }

    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                listCars(request, response);
            } else {
                switch (action) {
                    case "add":
                        showAddForm(request, response);
                        break;
                    case "edit":
                        showEditForm(request, response);
                        break;
                    case "delete":
                        deleteCar(request, response);
                        break;
                    case "view":
                        viewCar(request, response);
                    default:
                        listCars(request, response);
                        break;
                }
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // Handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                addCar(request, response);
            } else if ("edit".equals(action)) {
                editCar(request, response);
            } else {
                listCars(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // List all cars
    private void listCars(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Car> carList = carService.getAllCars();
            request.setAttribute("carList", carList);
            request.getRequestDispatcher("WEB-INF/view/AdminDashboard/cardetails.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving cars: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // Show the add form
    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/car.jsp").forward(request, response);
    }

    // Show the edit form
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carIdStr = request.getParameter("carId");

        if (carIdStr == null || carIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Car ID is required for editing!");
            return;
        }

        try {
            int carId = Integer.parseInt(carIdStr);
            Car car = carService.getCarById(carId);
            if (car != null) {
                request.setAttribute("car", car);
                request.getRequestDispatcher("/WEB-INF/view/AdminDashboard/editCar.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Car not found!");
            }
        } catch (NumberFormatException | SQLException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Car ID format!");
        }
    }
    
    

    // Add a new car
    private void addCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carModel = request.getParameter("carModel");
        String carType = request.getParameter("carType");
        String farePerKmStr = request.getParameter("farePerKm");

        if (carModel == null || carModel.trim().isEmpty() ||
            carType == null || carType.trim().isEmpty() ||
            farePerKmStr == null || farePerKmStr.trim().isEmpty()) {
            
            request.setAttribute("error", "All fields are required!");
            showAddForm(request, response);
            return;
        }

        try {
            double farePerKm = Double.parseDouble(farePerKmStr);
            Car newCar = new Car(0, carModel, carType, farePerKm);
            carService.addCar(newCar);

            int carId = newCar.getCarId(); // Now carId should be set correctly

            // Redirect to the driver form with carId
            response.sendRedirect("driver?action=add&carId=" + carId);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid fare per km value!");
            showAddForm(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            showAddForm(request, response);
        }
    }


    private void viewCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int carId = Integer.parseInt(request.getParameter("carId"));
            Car car = carService.getCarById(carId);

            if (car != null) {
                request.setAttribute("car", car);  // Ensure customer object is set as a request attribute
                request.getRequestDispatcher("WEB-INF/view/AdminDashboard/viewCar.jsp").forward(request, response);  // Forward to the correct JSP
            } else {
                request.setAttribute("errorMessage", "Car not found.");
                request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid car ID format.");
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }
    
    
    

    
    private void editCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carIdStr = request.getParameter("carId");

        if (carIdStr == null || carIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Car ID is required for editing!");
            return;
        }

        try {
            int carId = Integer.parseInt(carIdStr);
            String carModel = request.getParameter("carModel");
            String carType = request.getParameter("carType");
            double farePerKm = Double.parseDouble(request.getParameter("farePerKm"));

            // Create a new Car object with updated details
            Car updatedCar = new Car(carId, carModel, carType, farePerKm);
            
            // Call the service to update the car details
            carService.updateCar(updatedCar);

            // Redirect back to the car list page
            response.sendRedirect("CarController?action=list");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Car ID or Fare format!");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    
    
    
    


    // Delete a car
    private void deleteCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carIdStr = request.getParameter("carId");

        if (carIdStr == null || carIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Car ID is required for deletion!");
            return;
        }

        try {
            int carId = Integer.parseInt(carIdStr);
            carService.deleteCar(carId);
            response.sendRedirect("CarController");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Car ID format!");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }
}
