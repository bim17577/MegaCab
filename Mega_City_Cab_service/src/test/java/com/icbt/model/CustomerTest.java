package com.icbt.model;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CustomerTest {
    
    @Test
    public void testCustomerConstructorWithAllFields() {
        Customer customer = new Customer(1, "John Doe", "john@example.com", "123 Street, City", 1234567890, "123456789V", "johndoe", "password123");
        
        assertEquals(1, customer.getCustomerId());
        assertEquals("John Doe", customer.getName());
        assertEquals("john@example.com", customer.getEmail());
        assertEquals("123 Street, City", customer.getAddress());
        assertEquals(1234567890, customer.getPhonenumber());
        assertEquals("123456789V", customer.getNic());
        assertEquals("johndoe", customer.getUsername());
        assertEquals("password123", customer.getPassword());
    }
    
    @Test
    public void testCustomerConstructorWithoutCustomerId() {
        Customer customer = new Customer("Jane Doe", "jane@example.com", "456 Street, City", "987654321V", 987654321, "janedoe", "securePass");
        
        assertEquals("Jane Doe", customer.getName());
        assertEquals("jane@example.com", customer.getEmail());
        assertEquals("456 Street, City", customer.getAddress());
        assertEquals("987654321V", customer.getNic());
        assertEquals(987654321, customer.getPhonenumber());
        assertEquals("janedoe", customer.getUsername());
        assertEquals("securePass", customer.getPassword());
    }
    
    @Test
    public void testCustomerSettersAndGetters() {
        Customer customer = new Customer();
        
        customer.setCustomerId(2);
        customer.setName("Alice Smith");
        customer.setEmail("alice@example.com");
        customer.setAddress("789 Street, City");
        customer.setPhonenumber(555123456);
        customer.setNic("555555555V");
        customer.setUsername("alicesmith");
        customer.setPassword("alicePass");
        
        assertEquals(2, customer.getCustomerId());
        assertEquals("Alice Smith", customer.getName());
        assertEquals("alice@example.com", customer.getEmail());
        assertEquals("789 Street, City", customer.getAddress());
        assertEquals(555123456, customer.getPhonenumber());
        assertEquals("555555555V", customer.getNic());
        assertEquals("alicesmith", customer.getUsername());
        assertEquals("alicePass", customer.getPassword());
    }
    
    @Test
    public void testInvalidPhoneNumber() {
        IllegalArgumentException exception = assertThrows(IllegalArgumentException.class, () -> {
            new Customer(3, "Bob Brown", "bob@example.com", "Unknown Address", -123456789, "444444444V", "bobbrown", "pass");
        });

        assertEquals("Phone number cannot be negative.", exception.getMessage());
    }
}
