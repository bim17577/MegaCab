<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-container">
        <h2>Book a Ride</h2>
        
        <form action="booking?action=add" method="post">
            <!-- Customer ID (Automatically filled) -->
            <div class="form-group">
                <label for="customerId">Customer ID</label>
                <input type="number" class="form-control" id="customerId" name="customerId" value="${customerId}" placeholder="Enter Customer ID" required readonly>
            </div>

            <!-- Car ID (Automatically filled based on available cars) -->
            <div class="form-group">
                <label for="carId">Car ID</label>
                <input type="number" class="form-control" id="carId" name="carId" value="${carId}" placeholder="Enter Car ID" required readonly>
            </div>

            <!-- Driver ID (Automatically filled based on selection or logic) -->
            <div class="form-group">
                <label for="driverId">Driver ID</label>
                <input type="number" class="form-control" id="driverId" name="driverId" value="${driverId}" placeholder="Enter Driver ID" required readonly>
            </div>

            <!-- Pickup Location -->
            <div class="form-group">
                <label for="pickupLocation">Pickup Location</label>
                <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" placeholder="Enter Pickup Location" required>
            </div>

            <!-- Destination -->
            <div class="form-group">
                <label for="destination">Destination</label>
                <input type="text" class="form-control" id="destination" name="destination" placeholder="Enter Destination" required>
            </div>

            <!-- Distance -->
            <div class="form-group">
                <label for="distance">Distance (in km)</label>
                <input type="number" class="form-control" id="distance" name="distance" step="0.01" placeholder="Enter Distance" required>
            </div>

            <!-- Status -->
            <div class="form-group">
                <label for="status">Booking Status</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="Pending">Pending</option>
                    <option value="Completed">Completed</option>
                </select>
            </div>

            <!-- Car Type (Automatically filled based on selected car) -->
            <div class="form-group">
                <label for="carType">Car Type</label>
                <input type="text" class="form-control" id="carType" name="carType" value="${carType}" readonly required>
            </div>

            <!-- Payment Method -->
            <div class="form-group">
                <label for="paymentMethod">Payment Method</label>
                <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                    <option value="Credit Card">Credit Card</option>
                    <option value="Debit Card">Debit Card</option>
                    <option value="Cash">Cash</option>
                </select>
            </div>

            <!-- Booking Date -->
            <div class="form-group">
                <label for="bookingDate">Booking Date</label>
                <input type="datetime-local" class="form-control" id="bookingDate" name="bookingDate" required>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary btn-block">Book Ride</button>
        </form>
    </div>
</div>

<!-- Optional: Add Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
