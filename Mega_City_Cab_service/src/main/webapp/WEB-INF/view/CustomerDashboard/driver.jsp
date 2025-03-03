<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Driver Form</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 28px;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 5px;
        }

        select, input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }

        .btn {
            background-color: #2575fc;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #6a11cb;
        }

        .back-button {
            display: inline-block;
            margin-top: 20px;
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .back-button:hover {
            background-color: #5a6268;
            border-color: #4e555b;
        }

        #driverImage {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Enter Driver Details</h2>
             <form action="driver?action=add" method="post">

        
            <div class="form-group">
                <label for="driverName">Driver Name:</label>
                <select id="driverName" name="driverName" required onchange="updateDriverDetails()">
                    <option value="John Doe" data-phone="123-456-7890" data-license="AB123456" data-image="images/1.jpg">John Doe</option>
                    <option value="Jane Smith" data-phone="987-654-3210" data-license="CD987654" data-image="images/jane_smith.jpg">Jane Smith</option>
                    <option value="Robert Brown" data-phone="555-123-4567" data-license="EF654321" data-image="images/robert_brown.jpg">Robert Brown</option>
                    <option value="Emily Davis" data-phone="777-888-9999" data-license="GH112233" data-image="images/emily_davis.jpg">Emily Davis</option>
                </select><br>

                <img id="driverImage" class="driver-image" src="images/default.jpg" alt="Driver Image" /><br>

                <label for="phone_number">Phone Number:</label>
                <input type="text" id="phone_number" name="phone_number" required><br>

                <label for="license_number">License Number:</label>
                <input type="text" id="license_number" name="license_number" required><br>

                <!-- Car ID (readonly) -->
                <label for="car_id">Assigned Car ID:</label>
                <input type="text" id="car_id" name="car_id" value="<%= request.getParameter("carId") != null ? request.getParameter("carId") : "" %>" readonly><br>

                <button type="submit" class="btn">Add Driver</button>
            </div>
        </form>

        <div class="button-container">
            <a href="driverDetails.jsp" class="back-button btn">View Driver Details</a>
        </div>
    </div>

    <script>
        // Update driver details (phone, license, and image) based on selected driver
        function updateDriverDetails() {
            var select = document.getElementById("driverName");
            var selectedOption = select.options[select.selectedIndex];
            document.getElementById("phone_number").value = selectedOption.getAttribute("data-phone");
            document.getElementById("license_number").value = selectedOption.getAttribute("data-license");
            document.getElementById("driverImage").src = selectedOption.getAttribute("data-image");
        }

        // Placeholder for form validation (if needed)
        function validateForm() {
            // Add validation logic here if necessary
            return true; // Submit the form
        }
    </script>
</body>
</html>
