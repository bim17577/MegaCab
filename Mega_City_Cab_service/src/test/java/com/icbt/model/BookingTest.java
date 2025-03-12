package com.icbt.model;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import java.sql.Timestamp;

public class BookingTest {

    @Test
    public void testBookingConstructorWithAllAttributes() {
        // Creating a timestamp for booking date
        Timestamp bookingDate = new Timestamp(System.currentTimeMillis());

        // Creating a Booking object with all attributes (without car_type)
        Booking booking = new Booking(101, 1, 5, 10, "Colombo", "Kandy", 
                                      90, "Confirmed", "Credit Card", bookingDate);

        // Verifying that the booking object was created with the expected values
        assertEquals(101, booking.getBookingNumber());
        assertEquals(1, booking.getCustomerId());
        assertEquals(5, booking.getCarId());
        assertEquals(10, booking.getDriverId());
        assertEquals("Colombo", booking.getPickupLocation());
        assertEquals("Kandy", booking.getDestination());
        assertEquals(90, booking.getDistance());
        assertEquals("Confirmed", booking.getStatus());
        assertEquals("Credit Card", booking.getPaymentMethod());
        assertEquals(bookingDate, booking.getBookingDate());
    }

    @Test
    public void testSettersAndGetters() {
        // Creating an empty Booking object
        Booking booking = new Booking(1, 5, 10, "Jaffna", "Kandy", 300.0, "Pending", "Cash");

        // Setting values using setters
        booking.setBookingNumber(202);
        booking.setStatus("Completed");
        booking.setPaymentMethod("Debit Card");

        // Verifying the values using getters
        assertEquals(202, booking.getBookingNumber());
        assertEquals("Completed", booking.getStatus());
        assertEquals("Debit Card", booking.getPaymentMethod());
    }

    @Test
    public void testInvalidDistance() {
        // Creating a Booking object with the constructor that takes parameters
        Timestamp bookingDate = new Timestamp(System.currentTimeMillis());
        Booking booking = new Booking(1, 2, 3, 4, "Location", "Destination", 100.0, "Pending", "Cash", bookingDate);

        // Ensuring the exception is thrown when setting a negative distance
        Exception exception = assertThrows(IllegalArgumentException.class, () -> {
            booking.setDistance(-100.0);  // Trying to set a negative distance
        });

        // Verifying the exception message
        assertEquals("Distance cannot be negative.", exception.getMessage());
    }

    @Test
    public void testBookingWithLimitedDetails() {
        // Creating a Booking object with limited details
    	Booking booking = new Booking(303, 2, "Cancelled");
    	booking.setCarId(1); // Set the car ID, if needed


        // Verifying the values
        assertEquals(303, booking.getBookingNumber());
        assertEquals(2, booking.getCustomerId());
        assertEquals("Cancelled", booking.getStatus());
    }
}
