<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            line-height: 1.6;
              background: url('images/9.jpg') center/cover no-repeat;
        }
        header {
            background: linear-gradient(90deg, #ff8c00, #ff4500);
            padding: 20px 0;
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
        .container {
            max-width: 1100px;
            margin: 120px auto 40px;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
        }
        .container h2 {
            text-align: center;
            color: #ff4500;
            margin-bottom: 20px;
            font-size: 2em;
            font-weight: 600;
        }
        .about-image {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        .about-text {
            color: #333;
            text-align: center;
            margin-bottom: 40px;
            font-size: 1.1em;
            line-height: 1.8;
        }
        .highlights {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 30px;
            margin-top: 40px;
        }
        .highlight-box {
            flex: 1 1 30%;
            padding: 30px;
            background: #ff4500;
            color: white;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
        }
        .highlight-box:hover {
            transform: scale(1.05);
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
        }
        .highlight-box i {
            font-size: 50px;
            margin-bottom: 15px;
        }
        .highlight-box h3 {
            font-size: 1.5em;
            margin-bottom: 15px;
            font-weight: 600;
        }
        .highlight-box p {
            font-size: 1.1em;
        }
        .team-grid {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 40px;
        }
        .team-member {
            text-align: center;
            margin: 20px;
        }
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
        }
        .team-member h3 {
            margin-bottom: 10px;
            font-size: 1.3em;
            font-weight: 600;
            color: #333;
        }
        .team-member p {
            font-size: 1.1em;
            color: #555;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 1em;
            position: relative;
            bottom: 0;
            width: 100%;
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

    <div class="container">
        <img src="https://eu-assets.simpleview-europe.com/conwy2019/imageresizer/?image=%2Fdmsimgs%2FTaxi_1708985936.jpg&action=ProductDetailPro" alt="Mega City Cab" class="about-image">
        <div class="about-text">
            <h2>About Mega City Cab</h2>
            <p>Welcome to Mega City Cab, a trusted name in Colombo's transportation scene. Whether you're heading to the airport, going on a night out, or need a reliable ride for your everyday commute, we've got you covered. Our fleet is modern, comfortable, and always ready to take you where you need to go.</p>
            <p>We pride ourselves on providing safe, timely, and affordable transportation options to our customers. Our drivers are highly trained professionals committed to ensuring that you get to your destination without hassle or delay.</p>
        </div>
    </div>

    <div class="container">
        <h2>Our Services</h2>
        <div class="highlights">
            <div class="highlight-box">
                <i class="fas fa-car"></i>
                <h3>Modern Fleet</h3>
                <p>Choose from a range of comfortable and stylish cars, each equipped with top-notch amenities to make your ride pleasant and enjoyable.</p>
            </div>
            <div class="highlight-box">
                <i class="fas fa-clock"></i>
                <h3>24/7 Service</h3>
                <p>We operate round the clock, ensuring that you always have a reliable ride available, no matter the time of day or night.</p>
            </div>
            <div class="highlight-box">
                <i class="fas fa-map-marker-alt"></i>
                <h3>Citywide Coverage</h3>
                <p>Our cabs are available throughout Colombo and the surrounding areas, ensuring you're never too far from a safe and convenient ride.</p>
            </div>
        </div>
    </div>

    <div class="container">
        <h2>Meet Our Team</h2>
        <div class="team-grid">
            <div class="team-member">
                <img src="https://source.unsplash.com/150x150/?man,face" alt="Team Member">
                <h3>John Doe</h3>
                <p>Founder & CEO</p>
            </div>
            <div class="team-member">
                <img src="https://source.unsplash.com/150x150/?woman,face" alt="Team Member">
                <h3>Jane Smith</h3>
                <p>Operations Manager</p>
            </div>
            <div class="team-member">
                <img src="https://source.unsplash.com/150x150/?man,face" alt="Team Member">
                <h3>Mike Johnson</h3>
                <p>Customer Relations</p>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>
</body>
</html>
