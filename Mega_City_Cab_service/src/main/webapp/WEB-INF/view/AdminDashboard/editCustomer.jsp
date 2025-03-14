<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkm6j5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
    <h2>Edit Customer</h2>

    <!-- Check if customer is null or missing -->
    <c:if test="${empty customer}">
        <div class="alert alert-danger" role="alert">
            Customer data is missing.
        </div>
    </c:if>
    
    <!-- If customer exists, show the form -->
    <c:if test="${not empty customer}">
      <!-- Ensure the form posts to the correct action -->
<form action="customer?action=update" method="post">
    <input type="hidden" name="customerId" value="${customer.customerId}" />

    <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control" id="name" name="name" value="${customer.name}" required />
    </div>
    <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" value="${customer.email}" required />
    </div>
    
    <div class="mb-3">
        <label for="address" class="form-label">Address</label>
        <input type="text" class="form-control" id="address" name="address" value="${customer.address}" required />
    </div>
    
    <div class="mb-3">
        <label for="phonenumber" class="form-label">Phone Number</label>
        <input type="text" class="form-control" id="phonenumber" name="phonenumber" value="${customer.phonenumber}" required />
    </div>
    <div class="mb-3">
        <label for="nic" class="form-label">NIC</label>
        <input type="text" class="form-control" id="nic" name="nic" value="${customer.nic}" required />
    </div>
   
    <button type="submit" class="btn btn-primary">Update Customer</button>
</form>
      
      
    </c:if>
</div>
    
</body>
</html>
