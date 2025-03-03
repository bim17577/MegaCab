<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-5">Login</h2>

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
            
            <div class="form-group mt-3">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group mt-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <div class="form-group mt-3">
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </div>
        </form>

        <!-- Error Message (if any) -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger mt-3">
                ${errorMessage}
            </div>
        </c:if>

        <!-- Redirect to Registration Page -->
        <p class="mt-3">Don't have an account? <a href="customer?action=add">Register Here</a></p>
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
