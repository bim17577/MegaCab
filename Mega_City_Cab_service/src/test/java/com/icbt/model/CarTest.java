package com.icbt.model;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CarTest {

    @Test
    public void testCarConstructorWithAllAttributes() {
        // Creating a Car object using the constructor with all attributes
        Car car = new Car(1, "Toyota Prius", "Hybrid", 12.5);

        // Verifying that the car object was created with the expected values
        assertEquals(1, car.getCarId());
        assertEquals("Toyota Prius", car.getCarModel());
        assertEquals("Hybrid", car.getCarType());
        assertEquals(12.5, car.getFarePerKm());
    }

    @Test
    public void testSettersAndGetters() {
        // Creating an empty Car object
        Car car = new Car();

        // Setting values using setters
        car.setCarId(2);
        car.setCarModel("Honda Civic");
        car.setCarType("Sedan");
        car.setFarePerKm(15.0);

        // Verifying the values using getters
        assertEquals(2, car.getCarId());
        assertEquals("Honda Civic", car.getCarModel());
        assertEquals("Sedan", car.getCarType());
        assertEquals(15.0, car.getFarePerKm());
    }

    @Test
    public void testNegativeFarePerKm() {
        // Checking if an exception is thrown for negative fare
        Exception exception = assertThrows(IllegalArgumentException.class, () -> {
            new Car(3, "Tesla Model S", "Electric", -5.0);
        });

        assertEquals("Fare per km cannot be negative.", exception.getMessage());

        // Checking the setter method also throws an exception
        Car car = new Car();
        Exception setterException = assertThrows(IllegalArgumentException.class, () -> {
            car.setFarePerKm(-10.0);
        });

        assertEquals("Fare per km cannot be negative.", setterException.getMessage());
    }
}
