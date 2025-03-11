<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
   background: url('images/19.webp') center/cover no-repeat;
           
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0;
        }
        .container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin-top: 100px;
            z-index: 10; /* Ensures the form is above the background */
        }
        h2 {
            color: #333;
            font-size: 3rem;
            margin-bottom: 40px;
            text-align: center;
        }
        .form-group label {
            font-size: 1.3rem;
            color: #555;
        }
        .form-control {
            padding: 20px;
            font-size: 1.2rem;
            border-radius: 8px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 15px;
            font-size: 1.3rem;
            width: 100%;
            border-radius: 8px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .alert {
            font-size: 1.1rem;
            padding: 15px;
        }
        p {
            text-align: center;
            font-size: 1.1rem;
        }
        a {
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }

        /* Gradient Animation for background */
        @keyframes gradientAnimation {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Login</h2>

        <!-- Login Form -->
        <form id="loginForm" action="customer?action=login" method="post">
            
            <!-- Role Selection Dropdown -->
            <div class="form-group">
                <label for="role">Select Role</label>
                <select class="form-control" id="role" name="role" required onchange="updateAction()">
                    <option value="customer">Customer Login</option>
                    <option value="admin">Admin Login</option>
                </select>
            </div>
            
            <div class="form-group mt-4">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group mt-4">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <div class="form-group mt-4">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>

        <!-- Error Message (if any) -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger mt-4">
                ${errorMessage}
            </div>
        </c:if>

        <!-- Redirect to Registration Page -->
        <p class="mt-4">Don't have an account? <a href="customer?action=add">Register Here</a></p>
    </div>

    <!-- JavaScript to Update Form Action Based on Dropdown Selection -->
    <script>
        function updateAction() {
            var role = document.getElementById('role').value;
            var form = document.getElementById('loginForm');
            
            if (role === 'admin' && form.action !== 'admin?action=login') {
                form.action = 'adminLogin?action=login'; // Admin Login action
            } else if (role === 'customer' && form.action !== 'customer?action=login') {
                form.action = 'customer?action=login'; // Customer Login action
            }
        }
    </script>
</body>
</html>
