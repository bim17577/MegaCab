<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Details</title>
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
        <h1 class="text-center mb-4">Bill Details</h1>

        <!-- Error message -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                ${errorMessage}
            </div>
        </c:if>

        <!-- Bill details table -->
        <c:if test="${not empty billDetails}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Bill ID</th>
                        <th>Booking Number</th>
                        <th>Customer ID</th>
                        <th>Total Fare</th>
                        <th>Tax Amount</th>
                        <th>Discount</th>
                        <th>Final Amount</th>
                        <th>Payment Status</th>
                        <th>Payment Method</th>
                        <th>Billing Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="bill" items="${billDetails}">
                        <tr>
                            <td>${bill.billId}</td>
                            <td>${bill.bookingNumber}</td>
                            <td>${bill.customerId}</td>
                            <td>${bill.totalFare}</td>
                            <td>${bill.taxAmount}</td>
                            <td>${bill.discount}</td>
                            <td>${bill.finalAmount}</td>
                            <td>${bill.paymentStatus}</td>
                            <td>${bill.paymentMethod}</td>
                            <td>${bill.billingDate}</td>
                            <td>
                                <!-- View button -->
                                <a href="bill?action=view&billId=${bill.billId}" class="btn btn-info">View</a>

                                <!-- Edit button -->
                                <a href="bill?action=edit&billId=${bill.billId}" class="btn btn-warning">Edit</a>

                                <!-- Delete button -->
                                <a href="bill?action=delete&billId=${bill.billId}" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- Button container -->
        <div class="text-center mt-4 button-container">
            <a href="bill?action=add" class="btn btn-primary">Add New Bill</a>
            <a href="adminLogin?action=login" class="btn back-button">Back to Admin Home</a>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
