<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
          background: url('images/11.jpg') center/cover no-repeat;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            line-height: 1.6;
        }
        header {
            background: linear-gradient(90deg, #ff8c00, #ff4500);
            padding: 15px 0;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
        }
        nav ul li {
            margin: 0 20px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s ease;
        }
        nav ul li a:hover {
            background: white;
            color: #ff4500;
        }
        .help-section {
            max-width: 900px;
            margin: 120px auto 20px;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.5s ease-in-out;
        }
        .help-section h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ff4500;
            font-size: 36px;
            font-weight: 600;
        }
        .help-section p {
            font-size: 18px;
            color: #333;
            margin-bottom: 15px;
            line-height: 1.8;
        }
        .help-section ul {
            list-style-type: disc;
            margin-left: 20px;
            font-size: 18px;
        }
        .help-section ul li {
            margin-bottom: 8px;
        }
        .faq {
            background: #ffffff;
            padding: 30px;
            margin: 40px auto;
            max-width: 900px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.5s ease-in-out;
        }
        .faq h3 {
            color: #ff4500;
            margin-bottom: 12px;
            font-size: 22px;
        }
        .faq p {
            font-size: 16px;
            color: #555;
            margin-bottom: 15px;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 40px;
            font-size: 1em;
        }
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
        .help-section h3, .faq h3 {
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        a {
            color: #ff4500;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="services.jsp">Services</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="customer?action=login">Sign in</a></li>
                <li><a href="help.jsp">Help</a></li>
            </ul>
        </nav>
    </header>

    <section class="help-section">
        <h2>System Usage Guidelines</h2>
        <p>Welcome to Mega City Cab! Below are some simple steps to help you navigate and use our system efficiently.</p>
        
        <h3>🚕 How to Book a Ride</h3>
        <ul>
            <li>Sign in to your account or create one.</li>
          
            <li>Choose your preferred vehicle type.</li>
                <li>Choose your preferred driver.</li>
                 <li>Enter your pickup and drop-off locations.</li>
            <li>Confirm the fare and estimated time.</li>
            <li>Click <strong>"Book Now"</strong> to confirm your ride.</li>
        </ul>

        <h3>💳 Payment Methods</h3>
        <p>We accept the following payment methods:</p>
        <ul>
            <li>Cash payment to the driver.</li>
            <li>Credit/Debit card payments via the app.</li>
            <li>Mobile wallet payments (GPay, Apple Pay, etc.).</li>
        </ul>

        <h3>📞 Customer Support</h3>
        <p>If you need assistance, contact our support team:</p>
        <ul>
            <li>Email: <a href="mailto:support@megacitycab.com">support@megacitycab.com</a></li>
            <li>Phone: +94 77 123 4567</li>
            <li>Live Chat: Available 24/7 in the app.</li>
        </ul>
    </section>

    <section class="faq">
        <h2>Frequently Asked Questions (FAQs)</h2>
        
        <h3>How do I create an account?</h3>
        <p>Click on <strong>Sign in</strong> and select <strong>Create Account</strong>. Enter your details and verify via email.</p>

        <h3>Can I schedule a ride in advance?</h3>
        <p>Yes! You can book a ride in advance by selecting the <strong>Schedule Ride</strong> option.</p>

        <h3>What should I do if I left something in the cab?</h3>
        <p>Contact our support team immediately with your ride details.</p>

        <h3>Is there a cancellation fee?</h3>
        <p>If you cancel within 5 minutes of booking, there's no charge. After that, a small fee applies.</p>
    </section>

    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>
</body>
</html>
