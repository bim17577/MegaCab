<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
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
            max-width: 500px;
            margin: auto;
        }

        h1 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
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

    </style>
</head>

<body>
    <div class="container">
        <h1>Logout Successful</h1>
        <p class="text-center">You have successfully logged out.</p>

        <!-- Change the form action to match the correct servlet URL pattern -->
        <form action="customer" method="post">
            <button type="submit" class="btn btn-primary mt-3">Go to Login</button>
        </form>
    </div>

    <%
        // Invalidate the session to log out the user
        session.invalidate();
    %>
</body>
</html>
