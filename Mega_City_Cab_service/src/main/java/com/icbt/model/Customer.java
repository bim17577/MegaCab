package com.icbt.model;

public class Customer {

    private int customerId;
    private String name;
    private String email;
    private String address;
    private int phonenumber;
    private String nic;
    private String username;
    private String password;

    // Constructor with all fields
    public Customer(int customerId, String name, String email, String address, int phonenumber, String nic, String username, String password) {
        if (phonenumber < 0) {
            throw new IllegalArgumentException("Phone number cannot be negative.");
        }
        this.customerId = customerId;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phonenumber = phonenumber;
        this.nic = nic;
        this.username = username;
        this.password = password;
    }

    // Constructor without customerId (for registration)
    public Customer(String name, String email, String address, String nic, int phonenumber, String username, String password) {
        if (phonenumber < 0) {
            throw new IllegalArgumentException("Phone number cannot be negative.");
        }
        this.name = name;
        this.email = email;
        this.address = address;
        this.nic = nic;
        this.phonenumber = phonenumber;
        this.username = username;
        this.password = password;
    }

    public Customer(int customerId, String name, String email, String username, String password) {
        this.customerId = customerId;
        this.name = name;
        this.email = email;
        this.username = username;
        this.password = password;
    }

 // Constructor with customerId, name, email, address, phoneNumber, and nic
    public Customer(int customerId, String name, String email, String address, int phoneNumber, String nic) {
        if (phoneNumber < 0) {
            throw new IllegalArgumentException("Phone number cannot be negative.");
        }
        this.customerId = customerId;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phonenumber = phonenumber;
        this.nic = nic;
    }

    public Customer() {
    }

    // Getters and Setters
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(int phonenumber) {
        if (phonenumber < 0) {
            throw new IllegalArgumentException("Phone number cannot be negative.");
        }
        this.phonenumber = phonenumber;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
