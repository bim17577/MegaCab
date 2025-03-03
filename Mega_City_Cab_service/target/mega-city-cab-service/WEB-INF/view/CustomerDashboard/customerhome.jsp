<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<%-- Check if customer is logged in --%>
<c:if test="${empty customer}">
    <script type="text/javascript">
        window.location.href = "CustomerDashboard/LoginPage.jsp";
    </script>
</c:if>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-5">Welcome to Your Dashboard, ${customer.name}!</h2>
        
        <div class="mt-4">
            <h4>Account Information</h4>
            <p><strong>Username:</strong> ${customer.username}</p>
            <p><strong>Email:</strong> ${customer.email}</p>
            <p><strong>Phone Number:</strong> ${customer.phoneNumber}</p>
            <p><strong>Address:</strong> ${customer.address}</p>
        </div>

        <div class="mt-4">
            <h4>Your Orders</h4>
            <p>Here, you can view your previous orders and track your tickets.</p>
            <!-- Add your orders listing here if applicable -->
        </div>

        <div class="mt-4">
            <a href="customer?action=logout" class="btn btn-danger">Logout</a>
        </div>
    </div>
</body>
</html>
