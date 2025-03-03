package com.icbt.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.icbt.model.Customer;

public class CustomerDAO {

    public void addCustomer(Customer customer) {
        String query = "INSERT INTO Customer (name, email, address, phone_number, nic, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, customer.getName());
            statement.setString(2, customer.getEmail());
            statement.setString(3, customer.getAddress());
            statement.setInt(4, customer.getPhonenumber());
            statement.setString(5, customer.getNic());
            statement.setString(6, customer.getUsername());
            statement.setString(7, customer.getPassword());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void closeResources(ResultSet rs, PreparedStatement stmt, Connection conn) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Customer> getAllCustomers() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        String query = "SELECT * FROM Customer";

        try (Connection connection = DBConnection.getInstance().getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int customerId = resultSet.getInt("customer_id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int phoneNumber = resultSet.getInt("phone_number");
                String nic = resultSet.getString("nic");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");

                customers.add(new Customer(customerId, name, email, address, phoneNumber, nic, username, password));
            }
        }
        return customers;
    }

    public void deleteCustomer(int customerId) throws SQLException {
        String query = "DELETE FROM Customer WHERE customer_id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, customerId);
            statement.executeUpdate();
        }
    }

    public Customer getCustomerByUsernameAndPassword(String username, String password) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getInstance().getConnection();

            String sql = "SELECT customer_id, name, email, username, password FROM Customer WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int customerId = rs.getInt("customer_id");  // ✅ Declare customerId properly
                String name = rs.getString("name");
                String email = rs.getString("email");
                String retrievedUsername = rs.getString("username");
                String retrievedPassword = rs.getString("password");

                return new Customer(customerId, name, email, retrievedUsername, retrievedPassword);  // ✅ Match constructor
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, stmt, conn);
        }
        return null;
    }
}