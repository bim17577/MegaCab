package com.icbt.model;

import java.sql.Timestamp;

public class Booking {

    private int bookingNumber;        
    private int customerId;           
    private int carId;                
    private int driverId;            
    private String pickupLocation;    
    private String destination;       
    private double distance;         
    private String status;          
            
    private String paymentMethod;    
     
    private Timestamp bookingDate;    
    public Booking() {
        // Default constructor
    }


    // Constructor to initialize all fields (for retrieving booking details)
    public Booking(int bookingNumber, int customerId, int carId, int driverId, String pickupLocation,
                   String destination, double distance, String status, 
                   String paymentMethod, Timestamp bookingDate) {
        this.bookingNumber = bookingNumber;
        this.customerId = customerId;
        this.carId = carId;
        this.driverId = driverId;
        this.pickupLocation = pickupLocation;
        this.destination = destination;
        this.distance = distance;
        this.status = status;
       
        this.paymentMethod = paymentMethod;
      
        this.bookingDate = bookingDate;
    }

    // Constructor for creating a new booking (without booking number & timestamp)
    public Booking(int customerId, int carId, int driverId, String pickupLocation,
                   String destination, double distance, String status,  
                   String paymentMethod) {
        this.customerId = customerId;
        this.carId = carId;
        this.driverId = driverId;
        this.pickupLocation = pickupLocation;
        this.destination = destination;
        this.distance = distance;
        this.status = status;
      
        this.paymentMethod = paymentMethod;

    }

    // Constructor for listing bookings with limited details
    public Booking(int bookingNumber, int customerId, String status) {
        this.bookingNumber = bookingNumber;
        this.customerId = customerId;
        this.status = status;
     
       
    }

    // Getters and Setters

    public int getBookingNumber() {
        return bookingNumber;
    }

    public void setBookingNumber(int bookingNumber) {
        this.bookingNumber = bookingNumber;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        if (distance < 0) {
            throw new IllegalArgumentException("Distance cannot be negative.");
        }
        this.distance = distance;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   
   

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

  
    public Timestamp getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Timestamp bookingDate) {
        this.bookingDate = bookingDate;
    }
}
