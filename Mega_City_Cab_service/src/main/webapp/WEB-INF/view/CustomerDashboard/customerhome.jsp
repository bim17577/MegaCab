<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Mega City Cab - Customer Home</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
        }
        .hero {
            background: url('images/1.jpg') center/cover no-repeat;
            color: white;
            text-align: center;
            padding: 80px 20px;
        }
        .hero h1 {
            font-size: 2.8rem;
            font-weight: bold;
        }
        .hero p {
            font-size: 1.2rem;
        }
        .btn-book {
            background-color: #ff5722;
            color: white;
            padding: 12px 20px;
            font-size: 1.3rem;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.3s;
        }
        .btn-book:hover {
            background-color: #e64a19;
            transform: scale(1.05);
        }
        .container {
            max-width: 1000px;
            margin: auto;
            padding: 40px 20px;
        }
        .section-title {
            font-size: 2rem;
            color: #333;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .feature-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }
        .feature-box:hover {
            transform: scale(1.05);
        }
        .testimonial {
            background: #ffffff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-bottom: 15px;
        }
        .footer {
            text-align: center;
            padding: 20px;
            background: #222;
            color: white;
            margin-top: 30px;
        }

        /* Top Bar Styling */
        .top-bar {
            background-color: #343a40;
            color: white;
            padding: 10px 20px;
        }
        .top-bar .sign-out-exit {
            font-size: 1.1rem;
            font-weight: bold;
            transition: color 0.3s, transform 0.3s;
            text-decoration: none;
            color: white;
        }
        .top-bar .sign-out-exit:hover {
            color: #ff5722;
            transform: scale(1.1);
        }
        .top-bar .sign-out-exit + span {
            color: white;
            margin: 0 10px;
        }

        /* Styling for the images to be uniform */
        .feature-box img {
            width: 100%;
            height: 250px; /* You can adjust the height as needed */
            object-fit: cover; /* Ensure images cover the area uniformly */
            border-radius: 8px;
        }

        /* Optional: Add hover effect on images for more interactivity */
        .feature-box img:hover {
            transform: scale(1.05);
            transition: 0.3s;
        }
    </style>
</head>
<body>

    <!-- Top Bar with Sign Out and Exit Links (Right-Aligned) -->
    <div class="top-bar d-flex justify-content-between align-items-center">
        <div class="ms-auto">
            <a href="customer?action=logout" class="sign-out-exit">Sign Out</a>
            <span>|</span>
            <a href="index.jsp" class="sign-out-exit">Exit</a>
        </div>
    </div>
   
    <!-- Hero Section -->
    <div class="hero">
        <h1>Fast, Reliable & Affordable Cab Service in Colombo</h1>
        <p>Book a ride with Mega City Cab and travel comfortably anytime, anywhere.</p>
        <a href="CarController?action=add" class="btn-book">Book a Ride Now</a>
    </div>

    <h2 class="section-title">Featured Cars</h2>
    <div class="row">
        <div class="col-md-3">
            <div class="feature-box">
                <img src="images/4.jpg" alt="Car 1">
                <h4>Sedan</h4>
                <p>Perfect for business trips and special events.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <img src="images/5.jpg" alt="Car 2">
                <h4> SUV</h4>
                <p>Ideal for family trips or group outings.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <img src="images/6.webp" alt="Car 3">
                <h4>Hatchback</h4>
                <p>Affordable and efficient for quick city trips.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <img src="images/6.jpg" alt="Car 4">
                <h4>Minivan</h4>
                <p>Affordable and efficient for quick city trips.</p>
            </div>
        </div>
    </div>

    <!-- Pricing Plans Section -->
    <div class="container my-5">
        <h2 class="section-title">Affordable Pricing Plans</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="feature-box">
                    <h3>Basic Plan</h3>
                    <p>For short city rides. Transparent pricing, no hidden charges.</p>
                    <p><strong>$10</strong> per ride</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <h3>Standard Plan</h3>
                    <p>For regular travel around Colombo, with a discount on multiple rides.</p>
                    <p><strong>$20</strong> for 3 rides</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <h3>Premium Plan</h3>
                    <p>Best for business and events. VIP treatment with top-class services.</p>
                    <p><strong>$50</strong> for unlimited rides in a day</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Us Section -->
    <div class="container text-center my-5">
        <h2 class="section-title">Get In Touch</h2>
        <p>If you have any questions or need assistance, feel free to contact us!</p>
        <a href="contact.jsp" class="btn-book">Contact Us</a>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </div>

</body>
</html>
