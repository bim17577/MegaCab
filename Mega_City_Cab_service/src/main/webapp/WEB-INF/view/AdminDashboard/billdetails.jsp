<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Customers</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .details-table td, .details-table th {
            padding: 12px;
        }
        .action-buttons {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<main class="container">


    <!-- Display success message if available -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">
            ${successMessage}
        </div>
    </c:if>

    <!-- Display error message if available -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">
            ${errorMessage}
        </div>
    </c:if>

    <!-- Retrieve the latest booking and bill from the session -->
    <c:set var="booking" value="${sessionScope.latestBooking}" />
    <c:set var="bill" value="${sessionScope.latestBill}" />

    <!-- Display booking details -->
    <c:if test="${not empty booking}">
        <h3 class="mt-4">Booking Details</h3>
        <table class="table table-bordered table-hover details-table">
            <tr><th>Car ID</th><td>${booking.carId}</td></tr>
            <tr><th>Driver ID</th><td>${booking.driverId}</td></tr>
            <tr><th>Pickup Location</th><td>${booking.pickupLocation}</td></tr>
            <tr><th>Destination</th><td>${booking.destination}</td></tr>
            <tr><th>Distance</th><td>${booking.distance}</td></tr>
            <tr><th>Status</th><td>${booking.status}</td></tr>
            <tr><th>Payment Method</th><td>${booking.paymentMethod}</td></tr>
        </table>
    </c:if>

    <!-- Display bill details -->
    <c:if test="${not empty bill}">
        <h3 class="mt-4">Bill Details</h3>
        <table class="table table-bordered table-hover details-table">
            <tr><th>Bill ID</th><td>${bill.billId}</td></tr>
            <tr><th>Booking Number</th><td>${bill.bookingNumber}</td></tr>
            <tr><th>Customer ID</th><td>${bill.customerId}</td></tr>
            <tr><th>Total Fare</th><td><fmt:formatNumber value="${bill.totalFare}" pattern="##0.00"/></td></tr>
            <tr><th>Tax Amount</th><td><fmt:formatNumber value="${bill.taxAmount}" pattern="##0.00"/></td></tr>
            <tr><th>Discount</th><td><fmt:formatNumber value="${bill.discount}" pattern="##0.00"/></td></tr>
            <tr><th>Final Amount</th><td><fmt:formatNumber value="${bill.finalAmount}" pattern="##0.00"/></td></tr>
            <tr><th>Payment Status</th><td>${bill.paymentStatus}</td></tr>
            <tr><th>Payment Method</th><td>${bill.paymentMethod}</td></tr>
            <tr><th>Billing Date</th><td><fmt:formatDate value="${bill.billingDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td></tr>
        </table>
    </c:if>

    <c:if test="${empty booking and empty bill}">
        <p class="alert alert-warning">No booking or bill details available.</p>
    </c:if>

    <div class="action-buttons">
        <a href="adminLogin?action=login" class="btn btn-secondary">Back to Admin Home</a>
        <button onclick="window.print()" class="btn btn-primary">Print</button>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
