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
            <!-- Customer Name -->
            <div class="form-group">
                <label for="customerName">Customer Name</label>
                <input type="text" class="form-control" id="customerName" name="customerName" placeholder="Enter Your Name" required>
            </div>

            <!-- Contact Number -->
            <div class="form-group">
                <label for="contactNumber">Contact Number</label>
                <input type="text" class="form-control" id="contactNumber" name="contactNumber" placeholder="Enter Your Contact Number" required>
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

            <!-- Select Car Type -->
            <div class="form-group">
                <label for="carType">Car Type</label>
                <select class="form-control" id="carType" name="carType" required>
                    <option value="">Select Car Type</option>
                    <option value="sedan">Sedan</option>
                    <option value="suv">SUV</option>
                    <option value="hatchback">Hatchback</option>
                    <option value="minivan">Minivan</option>
                </select>
            </div>

            <!-- Payment Method -->
            <div class="form-group">
                <label for="paymentMethod">Payment Method</label>
                <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                    <option value="">Select Payment Method</option>
                    <option value="creditCard">Credit Card</option>
                    <option value="debitCard">Debit Card</option>
                    <option value="cash">Cash</option>
                </select>
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
