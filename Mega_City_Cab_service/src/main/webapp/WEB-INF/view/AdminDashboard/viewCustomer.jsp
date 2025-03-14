<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }

        .container {
            margin-top: 50px;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .customer-details h2 {
            text-align: center;
            color: #4e73df;
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: 600;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            background-color: #f8f9fc;
            border: 1px solid #d1d3e2;
            font-size: 1rem;
            color: #495057;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 5px rgba(78, 115, 223, 0.6);
        }

        .btn-back {
            display: inline-block;
            padding: 12px 30px;
            background-color: #4e73df;
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 50px;
            text-align: center;
            text-decoration: none;
            transition: all 0.3s ease;
            margin-top: 20px;
        }

        .btn-back:hover {
            background-color: #2e59d9;
            transform: translateY(-2px);
        }

        .btn-back:active {
            background-color: #1d45b1;
            transform: translateY(2px);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control[readonly] {
            background-color: #e9ecef;
        }

        .container h4 {
            color: #4e73df;
            text-align: center;
        }

    </style>
</head>
<body>

    <div class="container">
        <div class="customer-details">
            <h2>Customer Details</h2>
            <form>
                <div class="form-group">
                    <label for="customerId">Customer ID:</label>
                    <input type="text" class="form-control" id="customerId" value="${customer.customerId}" readonly>
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" value="${customer.name}" readonly>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" id="email" value="${customer.email}" readonly>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" id="address" value="${customer.address}" readonly>
                </div>
                <div class="form-group">
                    <label for="nic">NIC:</label>
                    <input type="text" class="form-control" id="nic" value="${customer.nic}" readonly>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" class="form-control" id="phoneNumber" value="${customer.phonenumber}" readonly>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" id="username" value="${customer.username}" readonly>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" class="form-control" id="password" value="${customer.password}" readonly>
                </div>
            </form>
            <div class="text-center">
                <a href="customer?action=list" class="btn-back">Back to Customer List</a>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
