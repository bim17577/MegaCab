<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register Customer</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* Body and page background */
        body {
            background-color: #f4f7fc;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            margin: auto;
        }

        h1 {
            font-size: 2.2rem;
            color: #333;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 600;
        }

        .form-group label {
            font-size: 1.1rem;
            color: #555;
            font-weight: 500;
        }

        .form-group input {
            border-radius: 8px;
            padding: 14px;
            font-size: 1rem;
            border: 1px solid #d1d8e0;
            width: 100%;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #6c63ff;
            outline: none;
            box-shadow: 0 0 10px rgba(108, 99, 255, 0.3);
        }

        .btn-primary {
            width: 100%;
            padding: 14px;
            background-color: #6c63ff;
            color: white;
            font-size: 1.1rem;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #5a52d1;
            transform: scale(1.05);
        }

        .btn-secondary {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            font-size: 1rem;
            border-radius: 8px;
            border: none;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .text-muted {
            font-size: 0.9rem;
            color: #999;
        }

        .form-group small {
            font-size: 0.85rem;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Register for an Account</h1>

        <form action="customer?action=add" method="post">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" class="form-control" id="phonenumber" name="phonenumber" pattern="[0-9]{10}" required>
                <small class="text-muted">Enter a 10-digit phone number</small>
            </div>
            
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>

            <div class="form-group">
                <label for="nic">NIC:</label>
                <input type="text" class="form-control" id="nic" name="nic" required>
            </div>

            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <button type="submit" class="btn btn-primary mt-3">Register</button>
        </form>

        <div class="text-center mt-3">
            <a href="customer?action=login" class="btn btn-secondary">Already have an account? Login</a>
        </div>
    </div>
</body>
</html>
