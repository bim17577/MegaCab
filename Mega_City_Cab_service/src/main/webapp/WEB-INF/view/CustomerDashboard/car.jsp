<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Car Form</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background: linear-gradient(45deg, #6db3f2, #1e78c1);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }
        h2 {
            color: white;
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }
        form {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 450px;
            text-align: center;
            transition: all 0.3s ease;
        }
        form:hover {
            transform: scale(1.05);
        }
        label {
            color: #333;
            font-size: 1.2em;
            margin-bottom: 10px;
            display: block;
            font-weight: 500;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 12px;
            margin: 15px 0;
            border: 2px solid #f1f1f1;
            border-radius: 8px;
            background-color: #f9f9f9;
            font-size: 1.1em;
            transition: all 0.3s ease;
        }
        input:focus, select:focus {
            border-color: #1e78c1;
            outline: none;
            background-color: #e7f0f7;
        }
        button[type="submit"] {
            width: 100%;
            padding: 15px;
            background-color: #1e78c1;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button[type="submit"]:hover {
            background-color: #6db3f2;
        }
        a {
            display: block;
            text-align: center;
            color: #1e78c1;
            text-decoration: none;
            font-size: 1.1em;
            margin-top: 20px;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #6db3f2;
            text-decoration: underline;
        }
        .form-container {
            max-width: 500px;
            width: 100%;
            margin: 0 auto;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Choose Your Ride</h2>
        
        <form action="CarController?action=add" method="post">
            <!-- Hidden field for Car ID -->
            <input type="hidden" name="carId" value="${car.carId}">

            <!-- Car Model input -->
            <label for="carModel">Car Model:</label>
         <select id="carModel" name="carModel" required>
                 <option value="Toyota Camry" ${car.carModel == 'Toyota Camry' ? 'selected' : ''}>Toyota Camry</option>
    <option value="Honda Accord" ${car.carModel == 'Honda Accord' ? 'selected' : ''}>Honda Accord</option>
    <option value="Hyundai Elantra" ${car.carModel == 'Hyundai Elantra' ? 'selected' : ''}>Hyundai Elantra</option>
    <option value="Nissan Altima" ${car.carModel == 'Nissan Altima' ? 'selected' : ''}>Nissan Altima</option>
            </select><br>

            <!-- Car Type dropdown -->
            <label for="carType">Car Type:</label>
            <select id="carType" name="carType" required>
                <option value="Sedan" ${car.carType == 'Sedan' ? 'selected' : ''}>Sedan</option>
                <option value="SUV" ${car.carType == 'SUV' ? 'selected' : ''}>SUV</option>
                <option value="Hatchback" ${car.carType == 'Hatchback' ? 'selected' : ''}>Hatchback</option>
                 <option value="Minivan" ${car.carType == 'Minivan' ? 'selected' : ''}>Minivan</option>
               <option value="MPV" ${car.carType == 'MPV' ? 'selected' : ''}>MPV (Multi-Purpose Vehicle)</option>
            </select><br>

            <!-- Distance Input -->
            <label for="distance">Enter Distance (KM):</label>
            <input type="number" id="distance" name="distance" min="1" required><br>

            <!-- Fare Per KM (Auto-Updated) -->
            <label for="farePerKm">Fare per KM:</label>
            <select id="farePerKm" name="farePerKm" required>
                <option value="10">0-10 KM: $10 per KM</option>
                <option value="15">11-20 KM: $15 per KM</option>
                <option value="20">21-30 KM: $20 per KM</option>
                <option value="25">31-50 KM: $25 per KM</option>
                <option value="30">51+ KM: $30 per KM</option>
            </select><br>

            <!-- Submit button -->
            <button type="submit">Submit</button>

            <!-- Cancel link -->
            <a href="CarController">Cancel</a>
        </form>
    </div>

    <script>
        document.getElementById("distance").addEventListener("input", function() {
            let distance = parseInt(this.value);
            let fareDropdown = document.getElementById("farePerKm");

            if (distance <= 10) {
                fareDropdown.value = "10";
            } else if (distance <= 20) {
                fareDropdown.value = "15";
            } else if (distance <= 30) {
                fareDropdown.value = "20";
            } else if (distance <= 50) {
                fareDropdown.value = "25";
            } else {
                fareDropdown.value = "30";
            }
        });
    </script>
</body>
</html>
