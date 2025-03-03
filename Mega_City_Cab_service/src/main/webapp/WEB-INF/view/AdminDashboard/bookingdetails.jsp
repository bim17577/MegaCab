<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details</title>
    <link rel="stylesheet" href="styles.css"> <!-- Custom Styles -->
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        h2 {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #007bff;
        }

        h3 {
            font-size: 1.8rem;
            margin-top: 30px;
            color: #444;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        td {
            font-size: 1rem;
            color: #555;
        }

        .buttons {
            text-align: center;
            margin-top: 30px;
        }

        .buttons button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .buttons button:hover {
            background-color: #0056b3;
        }

        /* Add hover effect for tables */
        tr:hover {
            background-color: #f1f1f1;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Booking Details</h2>

        <!-- Display Booking Information -->
        <table class="booking-details-table">
            <tr>
                <th>Booking Number:</th>
                <td>${booking.booking_number}</td>
            </tr>
            <tr>
                <th>Customer Name:</th>
                <td>${booking.customer_name}</td>
            </tr>
            <tr>
                <th>Pickup Location:</th>
                <td>${booking.pickup_location}</td>
            </tr>
            <tr>
                <th>Destination:</th>
                <td>${booking.destination}</td>
            </tr>
            <tr>
                <th>Distance:</th>
                <td>${booking.distance} km</td>
            </tr>
            <tr>
                <th>Status:</th>
                <td>${booking.status}</td>
            </tr>
        </table>

        <!-- Display Car Information -->
        <h3>Car Information</h3>
        <table class="car-details-table">
            <tr>
                <th>Car ID:</th>
                <td>${booking.car.car_id}</td>
            </tr>
            <tr>
                <th>Car Model:</th>
                <td>${booking.car.car_model}</td>
            </tr>
            <tr>
                <th>License Plate:</th>
                <td>${booking.car.license_plate}</td>
            </tr>
            <tr>
                <th>Car Type:</th>
                <td>${booking.car.car_type}</td>
            </tr>
        </table>

        <!-- Display Driver Information -->
        <h3>Driver Information</h3>
        <table class="driver-details-table">
            <tr>
                <th>Driver ID:</th>
                <td>${booking.driver.driver_id}</td>
            </tr>
            <tr>
                <th>Driver Name:</th>
                <td>${booking.driver.driver_name}</td>
            </tr>
            <tr>
                <th>License Number:</th>
                <td>${booking.driver.license_number}</td>
            </tr>
            <tr>
                <th>Driver Status:</th>
                <td>${booking.driver.availability}</td>
            </tr>
        </table>

        <div class="buttons">
            <button onclick="window.location.href='bookinglist.jsp'">Back to Booking List</button>
        </div>
    </div>

</body>
</html>
