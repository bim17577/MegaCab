<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Booking Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f4f4f4;
        }
        .container {
            margin-top: 50px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
        }
        h2 {
            color: #007bff;
        }
        .btn-back {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .btn-back:hover {
            background-color: #5a6268;
            border-color: #4e555b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Booking Details</h2>
        <table class="table table-bordered mt-4">
            <tr>
                <th>Booking Number</th>
                <td>${booking.bookingNumber}</td>
            </tr>
            <tr>
                <th>Customer ID</th>
                <td>${booking.customerId}</td>
            </tr>
            <tr>
                <th>Car ID</th>
                <td>${booking.carId}</td>
            </tr>
            <tr>
                <th>Driver ID</th>
                <td>${booking.driverId}</td>
            </tr>
            <tr>
                <th>Pickup Location</th>
                <td>${booking.pickupLocation}</td>
            </tr>
            <tr>
                <th>Destination</th>
                <td>${booking.destination}</td>
            </tr>
            <tr>
                <th>Distance (km)</th>
                <td>${booking.distance} km</td>
            </tr>
            <tr>
                <th>Status</th>
                <td>${booking.status}</td>
            </tr>
            <tr>
                <th>Payment Method</th>
                <td>${booking.paymentMethod}</td>
            </tr>
            <tr>
                <th>Booking Date</th>
                <td>${booking.bookingDate}</td>
            </tr>
        </table>
        <div class="text-center mt-4">
            <a href="booking?action=list" class="btn btn-back">Back to Booking List</a>
        </div>
    </div>
</body>
</html>
