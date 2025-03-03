<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-5">Login</h2>

        <!-- Login Form -->
        <form action="customer?action=login" method="post">
            <div class="form-group">
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

            <!-- Display error message if login fails -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger mt-3">
                    <strong>Error:</strong> ${errorMessage}
                </div>
            </c:if>
        </form>

        <!-- Redirect to Registration Page -->
        <p class="mt-3">Don't have an account? <a href="customer?action=add">Register Here</a></p>
    </div>
</body>
</html>
