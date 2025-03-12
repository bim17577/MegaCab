package com.icbt.model; // Make sure this matches the folder structure

import com.icbt.dao.CustomerDAO;
import com.icbt.model.Customer;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class LoginTest {

    @Test
    public void testLoginSuccessful() {
        // Creating a valid customer
        Customer validCustomer = new Customer(1, "John Doe", "john@example.com", "123 Street, City", 1234567890, "123456789V", "johndoe", "password123");

        // Simulating adding the customer to the database
        CustomerDAO customerDAO = new CustomerDAO();
        customerDAO.addCustomer(validCustomer); // Assuming this adds to the data source
        
        // Now trying to login with the correct credentials
        Customer loggedInCustomer = customerDAO.getCustomerByUsernameAndPassword("johndoe", "password123");
        
        // Check if the login was successful
        assertNotNull(loggedInCustomer, "The customer should be logged in.");
        assertEquals("John Doe", loggedInCustomer.getName(), "The logged-in customer's name should match.");
    }

    @Test
    public void testLoginInvalidCredentials() {
        // Trying to login with invalid credentials
        CustomerDAO customerDAO = new CustomerDAO();
        
        // The username and password don't exist in the database
        Customer loggedInCustomer = customerDAO.getCustomerByUsernameAndPassword("johndoe", "wrongpassword");
        
        // Ensure that login fails and returns null
        assertNull(loggedInCustomer, "The customer should not be logged in with incorrect credentials.");
    }

    @Test
    public void testLoginNonExistingUser() {
        // Trying to login with a non-existing username
        CustomerDAO customerDAO = new CustomerDAO();
        
        // The username doesn't exist in the database
        Customer loggedInCustomer = customerDAO.getCustomerByUsernameAndPassword("nonexistentuser", "password123");
        
        // Ensure login returns null for a non-existing user
        assertNull(loggedInCustomer, "The customer should not be logged in with a non-existing user.");
    }
}
