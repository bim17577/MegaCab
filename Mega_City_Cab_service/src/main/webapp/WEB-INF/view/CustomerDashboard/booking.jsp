<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <!-- Customer ID -->
            <div class="form-group">
                <label for="customerId">Customer ID</label>
                <input type="number" class="form-control" id="customerId" name="customerId" placeholder="Enter Customer ID" required>
            </div>

            <!-- Car ID -->
            <div class="form-group">
                <label for="carId">Car ID</label>
                <input type="number" class="form-control" id="carId" name="carId" placeholder="Enter Car ID" required>
            </div>

            <!-- Driver ID -->
            <div class="form-group">
                <label for="driverId">Driver ID</label>
                <input type="number" class="form-control" id="driverId" name="driverId" placeholder="Enter Driver ID" required>
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

            <!-- Car Type -->
            <div class="form-group">
                <label for="carType">Car Type</label>
                <select class="form-control" id="carType" name="carType" required>
                    <option value="Sedan">Sedan</option>
                    <option value="SUV">SUV</option>
                    <option value="Hatchback">Hatchback</option>
                    <option value="Minivan">Minivan</option>
                </select>
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

            <!-- Fare Amount -->
            <div class="form-group">
                <label for="fareAmount">Fare Amount</label>
                <input type="number" class="form-control" id="fareAmount" name="fareAmount" step="0.01" placeholder="Enter Fare Amount" required>
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
