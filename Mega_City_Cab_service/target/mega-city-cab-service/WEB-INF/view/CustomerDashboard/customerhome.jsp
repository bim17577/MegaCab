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
    </style>
</head>
<body>

    <!-- Hero Section -->
    <div class="hero">
        <h1>Fast, Reliable & Affordable Cab Service in Colombo</h1>
        <p>Book a ride with Mega City Cab and travel comfortably anytime, anywhere.</p>
        <a href="CarController?action=add" class="btn-book">Book a Ride Now</a>
    </div>

    <!-- Why Choose Us Section -->
    <div class="container">
        <h2 class="section-title">Why Choose Mega City Cab?</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="feature-box">
                    <h3>🚖 Reliable Rides</h3>
                    <p>Available 24/7 with well-maintained cabs and experienced drivers.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <h3>💰 Affordable Prices</h3>
                    <p>Transparent pricing with no hidden charges.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <h3>📍 Easy Booking</h3>
                    <p>Book online or via our mobile-friendly website.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- How It Works Section -->
    <div class="container">
        <h2 class="section-title">How It Works?</h2>
        <div class="row">
            <div class="col-md-3">
                <div class="feature-box">
                    <h3>1️⃣ Sign Up</h3>
                    <p>Create an account or log in to get started.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="feature-box">
                    <h3>2️⃣ Enter Ride Details</h3>
                    <p>Provide your pickup location and destination.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="feature-box">
                    <h3>3️⃣ Get a Cab</h3>
                    <p>Choose your preferred cab and confirm booking.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="feature-box">
                    <h3>4️⃣ Enjoy Your Ride</h3>
                    <p>Sit back, relax, and reach your destination safely.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Testimonials Section -->
    <div class="container">
        <h2 class="section-title">What Our Customers Say</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="testimonial">
                    <p>"Mega City Cab is my go-to service for traveling in Colombo. Always on time!"</p>
                    <h5>- Ruwan, Colombo</h5>
                </div>
            </div>
            <div class="col-md-6">
                <div class="testimonial">
                    <p>"Affordable, clean cabs, and friendly drivers. Highly recommended!"</p>
                    <h5>- Anjali, Dehiwala</h5>
                </div>
            </div>
        </div>
    </div>

    <!-- Booking Call to Action -->
    <div class="container text-center">
        <h2>Ready to Ride?</h2>
        <p>Book your cab now and travel hassle-free.</p>
        <a href="booking.jsp" class="btn-book">Book a Ride</a>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </div>

</body>
</html>
