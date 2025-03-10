package com.icbt.model;

import java.util.Date;

public class Bill {
    private int billId;
    private int bookingNumber;
    private int customerId;
    private double totalFare;
    private double taxAmount;
    private double discount;
    private double finalAmount;
    private String paymentStatus;
    private String paymentMethod;
    private Date billingDate;
    private boolean isDriverAssigned;

    
    // Getters and Setters
    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

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

    public double getTotalFare() {
        return totalFare;
    }

    public void setTotalFare(double totalFare) {
        this.totalFare = totalFare;
    }

    public double getTaxAmount() {
        return taxAmount;
    }

    public void setTaxAmount(double taxAmount) {
        this.taxAmount = taxAmount;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getFinalAmount() {
        return finalAmount;
    }

    public void setFinalAmount(double finalAmount) {
        this.finalAmount = finalAmount;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Date getBillingDate() {
        return billingDate;
    }

    public void setBillingDate(Date billingDate) {
        this.billingDate = billingDate;
    }

    public boolean isDriverAssigned() {
        return isDriverAssigned;
    }

    public void setDriverAssigned(boolean driverAssigned) {
        isDriverAssigned = driverAssigned;
    }

    // Updated method to calculate final amount (apply tax & discount only if driver is assigned)
    public void calculateFinalAmount() {
        if (isDriverAssigned) {
            // Apply discount first
            double discountedFare = totalFare - (totalFare * discount / 100);

            // Apply tax on the discounted fare
            double amountAfterTax = discountedFare + (discountedFare * taxAmount / 100);

            // Set final amount
            this.finalAmount = amountAfterTax;
        } else {
            // No discount or tax applied if driver is not assigned
            this.finalAmount = totalFare;
        }
    }
}
