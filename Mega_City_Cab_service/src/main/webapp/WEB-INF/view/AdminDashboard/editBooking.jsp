<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Booking Details</title>
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
        .btn-save {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-save:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Edit Booking Details</h2>
        <form action="booking?action=update" method="post">
            <input type="hidden" name="bookingNumber" value="${booking.bookingNumber}">
            <div class="mb-3">
                <label class="form-label">Customer ID</label>
                <input type="text" class="form-control" name="customerId" value="${booking.customerId}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Car ID</label>
                <input type="text" class="form-control" name="carId" value="${booking.carId}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Driver ID</label>
                <input type="text" class="form-control" name="driverId" value="${booking.driverId}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Pickup Location</label>
                <input type="text" class="form-control" name="pickupLocation" value="${booking.pickupLocation}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Destination</label>
                <input type="text" class="form-control" name="destination" value="${booking.destination}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Distance (km)</label>
                <input type="number" class="form-control" name="distance" value="${booking.distance}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Status</label>
                <select class="form-select" name="status">
                    <option value="Pending" ${booking.status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="Confirmed" ${booking.status == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                    <option value="Cancelled" ${booking.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Payment Method</label>
                <select class="form-select" name="paymentMethod">
                    <option value="Cash" ${booking.paymentMethod == 'Cash' ? 'selected' : ''}>Cash</option>
                    <option value="Card" ${booking.paymentMethod == 'Card' ? 'selected' : ''}>Card</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Booking Date</label>
                <input type="date" class="form-control" name="bookingDate" value="${booking.bookingDate}" required>
            </div>
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-save">Save Changes</button>
                <a href="booking?action=list" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
