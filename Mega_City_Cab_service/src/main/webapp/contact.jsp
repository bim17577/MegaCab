<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
             background: url('images/19.jpg') center/cover no-repeat;
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
        .contact-section {
            max-width: 800px;
            margin: 100px auto 20px;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .contact-section h2 {
            margin-bottom: 10px;
            color: #ff4500;
            font-size: 28px;
        }
        .contact-info {
            margin: 20px 0;
            font-size: 1.1em;
            text-align: left;
        }
        .contact-info p {
            margin: 10px 0;
            display: flex;
            align-items: center;
        }
        .contact-info i {
            margin-right: 15px;
            color: #ff4500;
            font-size: 20px;
        }
        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }
        .contact-form button {
            background: #ff4500;
            color: white;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            font-size: 1em;
            transition: 0.3s;
            border-radius: 6px;
        }
        .contact-form button:hover {
            background: #ff8c00;
        }
        .map-container {
            margin-top: 20px;
        }
        iframe {
            width: 100%;
            height: 300px;
            border-radius: 10px;
            border: none;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 40px;
            font-size: 1em;
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

    <section class="contact-section">
        <h2>Contact Us</h2>
        <p>Reach out to Mega City Cab for any inquiries or assistance.</p>
        <div class="contact-info">
            <p><i class="fas fa-phone"></i> Customer Support: +94 112 345 678</p>
            <p><i class="fas fa-phone"></i> Book a Ride: +94 712 345 678</p>
            <p><i class="fas fa-envelope"></i> Email: support@megacitycab.com</p>
            <p><i class="fas fa-map-marker-alt"></i> Address: 45 Lotus Road, Colombo, Sri Lanka</p>
            <p><i class="fas fa-clock"></i> Working Hours: 24/7</p>
        </div>
        <form class="contact-form">
            <input type="text" placeholder="Your Name" required>
            <input type="email" placeholder="Your Email" required>
            <textarea rows="5" placeholder="Your Message" required></textarea>
            <button type="submit">Send Message</button>
        </form>
        <div class="map-container">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63318.610649828996!2d79.82831911565073!3d6.927078053709386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25938a0e23e0b%3A0x7959a5f60b6f1a3d!2sColombo%2C%20Sri%20Lanka!5e0!3m2!1sen!2sus!4v1710203045678!5m2!1sen!2sus" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </section>
    
    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>
</body>
</html>
