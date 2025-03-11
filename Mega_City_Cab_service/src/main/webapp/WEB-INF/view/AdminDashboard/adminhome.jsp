<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
        }
        .navbar {
            background: #007bff;
            padding: 15px;
        }
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: white;
        }
        .navbar-nav .nav-link {
            color: white;
            font-size: 1.1rem;
        }
        .dashboard {
            padding: 40px;
        }
        .dashboard-title {
            font-size: 2rem;
            color: #333;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .card {
            border-radius: 10px;
            text-align: center;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .card-text {
            font-size: 1.2rem;
            font-weight: bold;
            color: #007bff;
        }
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .btn-logout {
            background-color: #dc3545;
            color: white;
            font-size: 1.2rem;
            border-radius: 8px;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 20px;
            transition: 0.3s;
        }
        .btn-logout:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="customer?action=list">Manage Customers</a></li>
                <li class="nav-item"><a class="nav-link" href="CarController?action=list">Manage Car Details</a></li>
                <li class="nav-item"><a class="nav-link" href="booking?action=list">Manage Bookings</a></li>
                <li class="nav-item"><a class="nav-link" href="driver?action=list">Manage Drivers</a></li>
                         <li class="nav-item"><a class="nav-link" href="bill?action=add">Customer Bill</a></li>
            </ul>
        </div>
    </nav>

    <!-- Admin Dashboard -->
    <div class="container dashboard">
        <h2 class="dashboard-title">Welcome, Admin!</h2>

        <!-- Dashboard Cards -->
        <div class="row text-center">
            <div class="col-md-3">
                <div class="card">
                    <h3 class="card-title">Total Users</h3>
                    <p class="card-text">1,205</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <h3 class="card-title">Total Bookings</h3>
                    <p class="card-text">835</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <h3 class="card-title">Revenue</h3>
                    <p class="card-text">$50,230</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <h3 class="card-title">Pending Requests</h3>
                    <p class="card-text">15</p>
                </div>
            </div>
        </div>

        <!-- Customer Management Section -->
        <c:if test="${sessionScope.role == 'admin'}">
            <div class="mt-5 table-container">
                <h3>Customer Details</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="customer" items="${customers}">
                            <tr>
                                <td>${customer.id}</td>
                                <td>${customer.name}</td>
                                <td>${customer.email}</td>
                                <td>${customer.phone}</td>
                                <td>
                                    <a href="editCustomer.jsp?id=${customer.id}" class="btn btn-warning btn-sm">Edit</a>
                                    <a href="deleteCustomer?id=${customer.id}" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <!-- Logout Button -->
        <a href="customer?action=login" class="btn-logout">Logout</a>
    </div>

</body>
</html>
