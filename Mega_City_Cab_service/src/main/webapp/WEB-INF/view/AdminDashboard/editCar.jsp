<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Car</title>
    <!-- Add Bootstrap CDN for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f9fc;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .alert {
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 16px;
            color: #555;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ccc;
            padding: 10px;
            font-size: 14px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .btn {
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .d-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Custom styling for alert messages */
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 20px;
            }

            h2 {
                font-size: 20px;
            }

            .form-control {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Edit Car Details</h2>

        <!-- Check if car is null or missing -->
        <c:if test="${empty car}">
            <div class="alert alert-danger" role="alert">
                Car data is missing.
            </div>
        </c:if>

        <!-- If car exists, show the form -->
        <c:if test="${not empty car}">
            <form action="CarController" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="carId" value="${car.carId}">

                <div class="mb-3">
                    <label for="carModel" class="form-label">Car Model</label>
                    <input type="text" class="form-control" id="carModel" name="carModel" value="${car.carModel}" required />
                </div>
                
                <div class="mb-3">
                    <label for="carType" class="form-label">Car Type</label>
                    <input type="text" class="form-control" id="carType" name="carType" value="${car.carType}" required />
                </div>

                <div class="mb-3">
                    <label for="farePerKm" class="form-label">Fare per Km</label>
                    <input type="number" step="0.01" class="form-control" id="farePerKm" name="farePerKm" value="${car.farePerKm}" required />
                </div>

                <div class="d-flex">
                    <button type="submit" class="btn btn-primary">Update Car</button>
                    <a href="CarController" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </c:if>
    </div>

    <!-- Add Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
