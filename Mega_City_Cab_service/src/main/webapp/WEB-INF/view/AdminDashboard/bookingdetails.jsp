<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkm6j5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
        }
        .table {
            margin: auto;
            width: 90%;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }
        .table-bordered td, .table-bordered th {
            border: 1px solid #ddd;
        }
        .btn {
            font-size: 14px;
            padding: 5px 10px;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
        .btn-common {
            font-size: 14px;
            padding: 10px 20px; /* Increase padding to match button size */
            width: 200px; /* Set fixed width */
        }
        h1 {
            color: #007bff;
        }
        .back-button {
            margin-top: 20px;
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .back-button:hover {
            background-color: #5a6268;
            border-color: #4e555b;
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px; /* Add spacing between buttons */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1 class="text-center mb-4">Booking List</h1>

        <!-- Error message -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                ${errorMessage}
            </div>
        </c:if>

        <!-- Bookings table -->
        <c:if test="${not empty bookings}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Booking Number</th>
                        <th>Car ID</th>
                        <th>Driver ID</th>
                        <th>Pickup Location</th>
                        <th>Distance</th>
                        <th>Destination</th>
                        <th>Status</th>
                        <th>Payment Method</th>
                         <th>Booking Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookings}">
                        <tr>
                            <td>${booking.bookingNumber}</td>
                            <td>${booking.carId}</td>
                            <td>${booking.driverId}</td>
                            <td>${booking.pickupLocation}</td>
                            <td>${booking.distance}</td>
                            <td>${booking.destination}</td>
                            <td>${booking.status}</td>
                            <td>${booking.paymentMethod}</td>
                               <td>${booking.bookingDate}</td>
                            <td>
                              
                                
                      <a href="booking?action=view&bookingNumber=${booking.bookingNumber}" class="btn btn-info">View</a>
                  <a href="booking?action=edit&bookingNumber=${booking.bookingNumber}"class="btn btn-warning">Edit</a>
                   
                          <a href="booking?action=delete&bookingNumber=${booking.bookingNumber}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this booking?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- Button container -->
        <div class="text-center mt-4 button-container">
            <a href="booking?action=add" class="btn btn-primary">Add New Booking</a>
            <a href="adminLogin?action=login" class="btn back-button">Back to Admin Home</a>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
