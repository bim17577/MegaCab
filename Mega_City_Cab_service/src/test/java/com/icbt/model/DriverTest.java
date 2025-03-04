package com.icbt.model;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class DriverTest {

    // Test for constructor with all attributes
    @Test
    public void testDriverConstructorWithAllAttributes() {
        // Creating a Driver object using the constructor with all attributes
        Driver driver = new Driver(1, "John Doe", "1234567890", "ABC12345", 101);
        
        // Verifying that the driver object was created with the expected values
        assertEquals(1, driver.getDriverId());
        assertEquals("John Doe", driver.getName());
        assertEquals("1234567890", driver.getPhoneNumber());
        assertEquals("ABC12345", driver.getLicenseNumber());
        assertEquals(101, driver.getCarId());
    }

    // Test for constructor without driverId
    @Test
    public void testDriverConstructorWithoutDriverId() {
        // Creating a Driver object using the constructor without driverId
        Driver driver = new Driver("Jane Smith", "0987654321", "XYZ67890", 102);
        
        // Verifying that the driver object was created with the expected values
        assertEquals("Jane Smith", driver.getName());
        assertEquals("0987654321", driver.getPhoneNumber());
        assertEquals("XYZ67890", driver.getLicenseNumber());
        assertEquals(102, driver.getCarId());
        assertEquals(0, driver.getDriverId()); // The driverId should be initialized to 0
    }

    // Test for setters and getters
    @Test
    public void testSettersAndGetters() {
        // Create a Driver object with a constructor that doesn't take driverId
        Driver driver = new Driver("Alice", "1112223333", "DEF45678", 103);
        
        // Set driverId using the setter method
        driver.setDriverId(5);
        
        // Verifying that the setter correctly updated the driverId
        assertEquals(5, driver.getDriverId());

        // Setting other properties using setters
        driver.setName("Alice Johnson");
        driver.setPhoneNumber("4445556666");
        driver.setLicenseNumber("GHI12345");
        driver.setCarId(104);
        
        // Verifying that the setters correctly updated the fields
        assertEquals("Alice Johnson", driver.getName());
        assertEquals("4445556666", driver.getPhoneNumber());
        assertEquals("GHI12345", driver.getLicenseNumber());
        assertEquals(104, driver.getCarId());
    }
}
