package com.icbt.model;

public class Driver {
    private int driverId;
    private String name;
    private String phoneNumber;
    private String licenseNumber;
    private int carId;

    // Constructor with all attributes, including driverId
    public Driver(int driverId, String name, String phoneNumber, String licenseNumber, int carId) {
        this.driverId = driverId;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.licenseNumber = licenseNumber;
        this.carId = carId;
    }

    // Constructor without driverId (for creating new drivers)
    public Driver(String name, String phoneNumber, String licenseNumber, int carId) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.licenseNumber = licenseNumber;
        this.carId = carId;
    }

    // Getter and Setter Methods
    public int getDriverId() {
        return driverId;
    }

    public String getName() {
        return name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public int getCarId() {
        return carId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }
}
