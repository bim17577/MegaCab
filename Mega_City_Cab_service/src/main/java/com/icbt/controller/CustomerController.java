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
import com.icbt.model.Driver;
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
        } else if ("update".equals(action)) {
        	updateCustomer(request, response);
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
            // Handle other actions
            switch (action != null ? action : "login") {
                case "list":
                    listCustomers(request, response);
                    break;
                case "add":
                    showAddForm(request, response);
                    break;
                case "view":
                    viewCustomer(request, response);
                    break;
                case "edit":
                	showEditForm(request, response); // Ensures 'edit' logic is processed
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
            request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/customerhome.jsp").forward(request, response);
        } else {
            // Set the error message here for invalid login
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("/WEB-INF/view/CustomerDashboard/LoginPage.jsp").forward(request, response);
        }
    }


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

    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            Customer customer = customerService.getCustomerById(customerId);

            if (customer != null) {
                request.setAttribute("customer", customer);  // Ensure customer object is set as a request attribute
                request.getRequestDispatcher("WEB-INF/view/AdminDashboard/viewCustomer.jsp").forward(request, response);  // Forward to the correct JSP
            } else {
                request.setAttribute("errorMessage", "Customer not found.");
                request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid customer ID format.");
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request, response);
        }
    }

    // Show the edit form
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerIdStr = request.getParameter("customerId");

        if (customerIdStr == null || customerIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Customer ID is required for editing!");
            return;
        }

        try {
            int customerId = Integer.parseInt(customerIdStr);
            Customer customer = customerService.getCustomerById(customerId);
            if (customer != null) {
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("/WEB-INF/view/AdminDashboard/editCustomer.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Driver not found!");
            }
        } catch (NumberFormatException | SQLException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Driver ID format!");
        }
    }
    

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve customerId from the request parameter
        String customerIdStr = request.getParameter("customerId");

        if (customerIdStr == null || customerIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Customer ID is required for update!");
            return;
        }

        try {
            // Parse the customerId and other parameters
            int customerId = Integer.parseInt(customerIdStr);
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
           

            // Create a Customer object with the updated details
            Customer customer = new Customer(customerId, name, email, address, phoneNumber);

            // Update the customer in the database
            customerService.updateCustomer(customer);

            // Redirect to the customer list page
            response.sendRedirect("customer?action=list");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Customer ID format!");
        } catch (SQLException e) {
            // Handle SQL exceptions (e.g., database errors)
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
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
