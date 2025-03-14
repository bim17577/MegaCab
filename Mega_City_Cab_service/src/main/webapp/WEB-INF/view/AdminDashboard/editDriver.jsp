<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Driver Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
            max-width: 600px;
        }
        h2 {
            color: #007bff;
        }
        .btn-save {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-save:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Edit Driver Details</h2>
        <form action="driver?action=update" method="post">
            <input type="hidden" name="driverId" value="${driver.driverId}">
           
			<div class="mb-3">
                <label class="form-label">Driver Name</label>
                <select class="form-select" name="name">
                 <option value="John Doe" data-phone="123-456-7890" data-license="AB123456" data-image="images/1.jpg">John Doe</option>
                    <option value="Jane Smith" data-phone="987-654-3210" data-license="CD987654" data-image="images/jane_smith.jpg">Jane Smith</option>
                    <option value="Robert Brown" data-phone="555-123-4567" data-license="EF654321" data-image="images/robert_brown.jpg">Robert Brown</option>
                    <option value="Emily Davis" data-phone="777-888-9999" data-license="GH112233" data-image="images/emily_davis.jpg">Emily Davis</option>
                     </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="text" class="form-control" name="phoneNumber" value="${driver.phoneNumber}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">License Number</label>
                <input type="text" class="form-control" name="licenseNumber" value="${driver.licenseNumber}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Car ID</label>
                <input type="text" class="form-control" name="carId" value="${driver.carId}" required>
            </div>
            
            
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-save">Save Changes</button>
                <a href="driver?action=list" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
