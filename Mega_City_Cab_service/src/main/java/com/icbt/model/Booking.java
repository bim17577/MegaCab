package com.icbt.model;

public class Booking {

    private int bookingNumber;        // Booking ID (Primary Key)
    private int customerId;           // Customer ID (Foreign Key)
    private int carId;                // Car ID (Foreign Key)
    private int driverId;             // Driver ID (Foreign Key)
    private String pickupLocation;    // Pickup location
    private String destination;       // Destination
    private double distance;          // Distance traveled
    private String status;            // Status of the booking (e.g., Pending, Completed)
    private String carType;           // Type of car (e.g., Sedan, SUV)
    private String paymentMethod;     // Payment Method (e.g., Credit Card, Debit Card, Cash)

    // Constructor to initialize all fields
    public Booking(int bookingNumber, int customerId, int carId, int driverId, String pickupLocation,
                   String destination, double distance, String status, String carType, String paymentMethod) {
        this.bookingNumber = bookingNumber;
        this.customerId = customerId;
        this.carId = carId;
        this.driverId = driverId;
        this.pickupLocation = pickupLocation;
        this.destination = destination;
        this.distance = distance;
        this.status = status;
        this.carType = carType;
        this.paymentMethod = paymentMethod;
    }

    // Constructor without bookingNumber (for booking creation without an ID)
    public Booking(int customerId, int carId, int driverId, String pickupLocation,
                   String destination, double distance, String status, String carType, String paymentMethod) {
        this.customerId = customerId;
        this.carId = carId;
        this.driverId = driverId;
        this.pickupLocation = pickupLocation;
        this.destination = destination;
        this.distance = distance;
        this.status = status;
        this.carType = carType;
        this.paymentMethod = paymentMethod;
    }

    // Constructor for listing bookings with limited details (e.g., excluding some fields)
    public Booking(int bookingNumber, int customerId, String status, String carType) {
        this.bookingNumber = bookingNumber;
        this.customerId = customerId;
        this.status = status;
        this.carType = carType;
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
        this.distance = distance;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

  
    }

