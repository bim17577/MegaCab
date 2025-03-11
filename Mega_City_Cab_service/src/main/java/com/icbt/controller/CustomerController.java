package com.icbt.controller;
import com.icbt.dao.CustomerDAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.icbt.model.Customer;
import com.icbt.service.CustomerService;

public class CustomerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService;

    public void init() throws ServletException {
        customerService = CustomerService.getInstance();
    }

   

    // Handle the login request (POST method)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            login(request, response);
        } else if ("add".equals(action)) {
            addCustomer(request, response);
        } else {
            doGet(request, response);
        }
    }

    // Handle the logout request (GET method)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            logout(request, response);
        } else {
            switch (action != null ? action : "login") {
                case "list":
                    listCustomers(request, response);
                    break;
                case "add":
                    showAddForm(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                default:
                    showLoginForm(request, response);
                    break;
            }
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Username or password cannot be empty.");
            request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/LoginPage.jsp").forward(request, response);
            return;
        }

        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getCustomerByUsernameAndPassword(username, password);

        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        if (customer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);

            response.getWriter().write("Login Success");
            request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/customerhome.jsp").include(request, response);
        } else {
            response.getWriter().write("Invalid username or password");
            request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/LoginPage.jsp").include(request, response);
        }
    }





    
    // Handle logout
    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the session to log the user out
        request.getSession().invalidate();
        response.sendRedirect("/WEB-INF/view/CustomerDashboard/LoginPage.jsp");
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/CustomerDashboard/LoginPage.jsp").forward(request, response);
    }

    
    private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Customer> customerList = customerService.getAllCustomers();
            request.setAttribute("customers", customerList);
            request.getRequestDispatcher("WEB-INF/view/AdminDashboard/listCustomers.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/CustomerDashboard/addCustomer.jsp").forward(request, response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String nic = request.getParameter("nic");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phoneNumber = request.getParameter("phonenumber");

            // Validate and convert phone number
            int phoneNumberInt;
            try {
                phoneNumberInt = Integer.parseInt(phoneNumber);
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid phone number format.");
                request.getRequestDispatcher("WEB-INF/view/CustomerDashboard/addCustomer.jsp").forward(request, response);
                return;
            }

            Customer customer = new Customer(name, email, address, nic, phoneNumberInt, username, password);
            customerService.addCustomer(customer);

            // Store username and password in session after registration
            HttpSession session = request.getSession();
            session.setAttribute("savedUsername", username);
            session.setAttribute("savedPassword", password);
            
            // Get the customerId after customer creation
            int customerId = customer.getCustomerId();
            
            // Store customerId in session to use later
            session.setAttribute("customerId", customerId);

            // Log the customerId stored in session
            System.out.println("Stored customerId in session: " + session.getAttribute("customerId"));

            // Redirect to login page after successful registration
            response.sendRedirect("customer?action=login");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }


    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            customerService.deleteCustomer(customerId);
            response.sendRedirect("customer?action=list");
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid customer ID format.");
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }
}