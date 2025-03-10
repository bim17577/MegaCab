package com.icbt.dao;

import com.icbt.model.Bill;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {
    private Connection connection;

    // Constructor: Initialize database connection using DBConnection class
    public BillDAO() {
        // Get the connection from DBConnection singleton
        this.connection = DBConnection.getInstance().getConnection();
    }

    // Method to get all bills
    public List<Bill> getAllBills() {
        List<Bill> bills = new ArrayList<>();
        String query = "SELECT b.*, " +
                       "(SELECT COUNT(*) FROM booking bk WHERE bk.booking_number = b.booking_number AND bk.driver_id IS NOT NULL) AS isDriverAssigned " +
                       "FROM bill b";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillId(rs.getInt("bill_id")); // Corrected column name
                bill.setBookingNumber(rs.getInt("booking_number"));
                bill.setCustomerId(rs.getInt("customer_id"));
                bill.setTotalFare(rs.getDouble("total_fare")); // Corrected column name
                bill.setTaxAmount(rs.getDouble("tax_amount")); // Corrected column name
                bill.setDiscount(rs.getDouble("discount"));
                bill.setFinalAmount(rs.getDouble("final_amount")); // Corrected column name
                bill.setPaymentStatus(rs.getString("payment_status")); // Corrected column name
                bill.setPaymentMethod(rs.getString("payment_method")); // Corrected column name
                bill.setBillingDate(rs.getDate("billing_date")); // Corrected column name

                // Check if driver is assigned
                boolean isDriverAssigned = rs.getInt("isDriverAssigned") > 0;
                bill.setDriverAssigned(isDriverAssigned);

                // Calculate final amount based on driver assignment
                bill.calculateFinalAmount();

                bills.add(bill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bills;
    }

    public Bill getBillById(int billId) {
        Bill bill = null;
        String query = "SELECT b.*, " +
                       "(SELECT COUNT(*) FROM booking bk WHERE bk.booking_number = b.booking_number AND bk.driver_id IS NOT NULL) AS isDriverAssigned " +
                       "FROM bill b WHERE b.bill_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, billId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    bill = new Bill();
                    bill.setBillId(rs.getInt("bill_id"));
                    bill.setBookingNumber(rs.getInt("booking_number"));
                    bill.setCustomerId(rs.getInt("customer_id"));
                    bill.setTotalFare(rs.getDouble("total_fare"));
                    bill.setTaxAmount(rs.getDouble("tax_amount"));
                    bill.setDiscount(rs.getDouble("discount"));
                    bill.setFinalAmount(rs.getDouble("final_amount"));
                    bill.setPaymentStatus(rs.getString("payment_status"));
                    bill.setPaymentMethod(rs.getString("payment_method"));
                    bill.setBillingDate(rs.getDate("billing_date"));

                    // Debugging: Print the billId to verify if it's set correctly
                    System.out.println("Fetched Bill ID: " + bill.getBillId());

                    // Check if driver is assigned
                    boolean isDriverAssigned = rs.getInt("isDriverAssigned") > 0;
                    bill.setDriverAssigned(isDriverAssigned);

                    // Calculate final amount based on driver assignment
                    bill.calculateFinalAmount();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bill;
    }


    // Method to add a new bill
    public boolean addBill(Bill bill) {
        String query = "INSERT INTO bill (booking_number, customer_id, total_fare, tax_amount, discount, final_amount, payment_status, payment_method, billing_date) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, bill.getBookingNumber());
            stmt.setInt(2, bill.getCustomerId());
            stmt.setDouble(3, bill.getTotalFare());
            stmt.setDouble(4, bill.getTaxAmount());
            stmt.setDouble(5, bill.getDiscount());
            stmt.setDouble(6, bill.getFinalAmount());
            stmt.setString(7, bill.getPaymentStatus());
            stmt.setString(8, bill.getPaymentMethod());
            stmt.setDate(9, new java.sql.Date(bill.getBillingDate().getTime()));

            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                // Get the generated billId
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        // Set the generated billId to the Bill object
                        bill.setBillId(generatedKeys.getInt(1)); // assuming billId is an integer
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Method to update an existing bill
    public boolean updateBill(Bill bill) {
        String query = "UPDATE bill SET booking_number = ?, customer_id = ?, total_fare = ?, tax_amount = ?, discount = ?, final_amount = ?, payment_status = ?, " +
                       "payment_method = ?, billing_date = ? WHERE bill_id = ?"; // Corrected column name
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, bill.getBookingNumber());
            stmt.setInt(2, bill.getCustomerId());
            stmt.setDouble(3, bill.getTotalFare());
            stmt.setDouble(4, bill.getTaxAmount());
            stmt.setDouble(5, bill.getDiscount());
            stmt.setDouble(6, bill.getFinalAmount());
            stmt.setString(7, bill.getPaymentStatus());
            stmt.setString(8, bill.getPaymentMethod());
            stmt.setDate(9, new java.sql.Date(bill.getBillingDate().getTime()));
            stmt.setInt(10, bill.getBillId());
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to delete a bill
    public boolean deleteBill(int billId) {
        String query = "DELETE FROM bill WHERE bill_id = ?"; // Corrected column name
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, billId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
