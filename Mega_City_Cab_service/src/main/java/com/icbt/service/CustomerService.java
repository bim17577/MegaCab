package com.icbt.service;

import java.sql.SQLException;
import java.util.List;
import com.icbt.dao.CustomerDAO;
import com.icbt.model.Customer;

public class CustomerService {

    private static CustomerService instance;
    private CustomerDAO customerDAO;

    private CustomerService() {
        this.customerDAO = new CustomerDAO();
    }

    // Singleton pattern to ensure only one instance of the service
    public static CustomerService getInstance() {
        if (instance == null) {
            synchronized (CustomerService.class) {
                if (instance == null) {
                    instance = new CustomerService();
                }
            }
        }
        return instance;
    }
    public Customer getCustomerById(int customerId) throws SQLException {
        return customerDAO.getCustomerById(customerId);
    }

    // Method to add a customer
    public void addCustomer(Customer customer) {
        customerDAO.addCustomer(customer);
    }

    // Method to get all customers
    public List<Customer> getAllCustomers() throws SQLException {
        return customerDAO.getAllCustomers();
    }

    // Method to delete a customer by ID
    public void deleteCustomer(int customerId) throws SQLException {
        customerDAO.deleteCustomer(customerId);
    }

    // Method to get a customer by username and password
    public Customer getCustomerByUsernameAndPassword(String username, String password) {
        return customerDAO.getCustomerByUsernameAndPassword(username, password);
    }

// Add this updateCustomer method
public void updateCustomer(Customer customer) throws SQLException {
    customerDAO.updateCustomer(customer);  // Delegate the actual update to the DAO class
}
}