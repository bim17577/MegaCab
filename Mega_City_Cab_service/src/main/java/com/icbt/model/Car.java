package com.icbt.model;

public class Car {
    private int carId;
    private String carModel;
    private String carType;
    private double farePerKm;

    public Car() {}

    public Car(int carId, String carModel, String carType, double farePerKm) {
        if (farePerKm < 0) {
            throw new IllegalArgumentException("Fare per km cannot be negative.");
        }
        this.carId = carId;
        this.carModel = carModel;
        this.carType = carType;
        this.farePerKm = farePerKm;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public String getCarModel() {
        return carModel;
    }

    public void setCarModel(String carModel) {
        this.carModel = carModel;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public double getFarePerKm() {
        return farePerKm;
    }

    public void setFarePerKm(double farePerKm) {
        if (farePerKm < 0) {
            throw new IllegalArgumentException("Fare per km cannot be negative.");
        }
        this.farePerKm = farePerKm;
    }
}
