<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Services</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        
    }

    /* Body and Layout */
    body {
     background: url('images/20.webp') center/cover no-repeat;
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
          
    }

    /* Navigation Bar */
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

    /* Services Section */
    #services {
        padding: 80px 20px 50px 20px;
        text-align: center;
        background-color: #fff;
         background: url('images/20.webp') center/cover no-repeat;
    }

    #services h2 {
        font-size: 2.2em;
        margin-bottom: 30px;
        color: #ff4500;
        font-weight: bold;
    }

    #services p {
        font-size: 1.1em;
        margin-bottom: 40px;
        line-height: 1.6;
        color: #333;
    }

    /* Service Item Styles */
    .service-item {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 80%;  /* Decreased the width of the service items */
       background-color: #ffad60;
        color: black;
        border-radius: 12px;
        padding: 30px;  /* Reduced padding */
        margin-bottom: 25px;
        position: relative;
        overflow: hidden;
        transition: transform 0.4s ease, box-shadow 0.4s ease;
        margin-left: auto;
        margin-right: auto;
    }

    .service-item i {
        font-size: 3em;
        margin-right: 20px;
        transition: transform 0.3s ease;
        
    }

    .service-item .service-content {
        text-align: left;
    }

    .service-item .service-content h3 {
        font-size: 1.8em;
        margin-bottom: 10px;
        font-weight: bold;
    }

    .service-item .service-content p {
        font-size: 1em;
        margin-bottom: 15px;
    }

    .service-item:hover {
        transform: translateY(-8px);
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
        background-color: #f2f2f2; /* Light color for hover effect */
    }

    .service-item:hover i {
        transform: scale(1.15);
    }

    .service-item:hover .service-content h3 {
        color: #ff8c00;
    }

    .service-item:hover .service-content p {
        opacity: 0.8;
    }

    /* Hover Background Effect */
    .service-item:before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.3);
        transition: opacity 0.4s ease;
        opacity: 0;
        z-index: -1;
    }

    .service-item:hover:before {
        opacity: 1;
    }

    /* Available Vehicles Section */
    #vehicles {
        padding: 50px 20px;
        text-align: center;
        background-color: #fff;
    }

    #vehicles h2 {
        font-size: 2.2em;
        margin-bottom: 30px;
        color: #ff4500;
        font-weight: bold;
    }

    #vehicles .vehicle-item {
        display: inline-block;
        width: 22%;
        margin: 10px;
        text-align: center;
        background-color: #f2f2f2;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    #vehicles .vehicle-item:hover {
        transform: translateY(-5px);
        box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
    }

    #vehicles .vehicle-item img {
        width: 100%;
        border-radius: 12px;
        margin-bottom: 15px;
    }

    #vehicles .vehicle-item h3 {
        font-size: 1.5em;
        color: #333;
        margin-bottom: 10px;
    }

    #vehicles .vehicle-item p {
        font-size: 1em;
        color: #666;
    }

    /* Best Places Section */
    #best-places {
        padding: 50px 20px;
        text-align: center;
        background-color: #fff;
    }

    #best-places h2 {
        font-size: 2.2em;
        margin-bottom: 30px;
        color: #ff4500;
        font-weight: bold;
    }

    #best-places p {
        font-size: 1.1em;
        margin-bottom: 40px;
        line-height: 1.6;
        color: #333;
    }

    .place-item {
        display: inline-block;
        width: 22%;
        margin: 10px;
        text-align: center;
        background-color: #f2f2f2;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .place-item:hover {
        transform: translateY(-5px);
        box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
    }

    .place-item img {
        width: 100%;
        border-radius: 12px;
        margin-bottom: 15px;
    }

    .place-item h3 {
        font-size: 1.5em;
        color: #333;
        margin-bottom: 10px;
    }

    .place-item p {
        font-size: 1em;
        color: #666;
    }

    /* Footer */
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

    <!-- Navigation Bar -->
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

    <!-- Services Section -->
    <section id="services">
        <h2>Our Services</h2>
        <p>We offer a range of services to ensure that your ride is always comfortable, timely, and affordable. Our expert drivers, modern fleet, and customer-focused approach guarantee a hassle-free experience.</p>

        <!-- Service 1 -->
        <div class="service-item">
            <i class="fas fa-taxi"></i>
            <div class="service-content">
                <h3>Ride Booking</h3>
                <p>Book your ride instantly using our online booking system. Fast, easy, and convenient.</p>
            </div>
        </div>

        <!-- Service 2 -->
        <div class="service-item">
            <i class="fas fa-users"></i>
            <div class="service-content">
                <h3>Group Rides</h3>
                <p>Travel with your friends and family with our spacious and affordable group rides.</p>
            </div>
        </div>

        <!-- Service 3 -->
        <div class="service-item">
            <i class="fas fa-clock"></i>
            <div class="service-content">
                <h3>24/7 Availability</h3>
                <p>Our cabs are available round-the-clock to meet all your transportation needs, any time of the day.</p>
            </div>
        </div>

        <!-- Service 4 -->
        <div class="service-item">
            <i class="fas fa-check-circle"></i>
            <div class="service-content">
                <h3>Safe and Reliable</h3>
                <p>Our drivers are professional and committed to ensuring your safety during every ride.</p>
            </div>
        </div>

        <!-- Service 5 -->
        <div class="service-item">
            <i class="fas fa-map-marker-alt"></i>
            <div class="service-content">
                <h3>On-Time Service</h3>
                <p>We guarantee timely arrival and departure for your rides, so you're never late.</p>
            </div>
        </div>
    </section>

    <!-- Available Vehicles Section -->
    <section id="vehicles">
        <h2>Available Vehicles</h2>

        <!-- Vehicle 1 -->
        <div class="vehicle-item">
            <img src="images/4.jpg" alt="Sedan">
            <h3>Sedan</h3>
            <p>Comfortable for small groups, perfect for quick city commutes.</p>
        </div>

        <!-- Vehicle 2 -->
        <div class="vehicle-item">
            <img src="images/5.jpg" alt="SUV">
            <h3>SUV</h3>
            <p>Ideal for families or group rides, offering ample space and comfort.</p>
        </div>

        <!-- Vehicle 3 -->
        <div class="vehicle-item">
            <img src="images/6.jpg" alt="Minivan">
            <h3>Minivan</h3>
            <p>Great for larger groups, providing spacious seating for up to 8 passengers.</p>
        </div>

        <!-- Vehicle 4 -->
        <div class="vehicle-item">
            <img src="images/6.webp" alt="Luxury Car">
            <h3>Hetchback</h3>
            <p>For those seeking a premium experience, featuring top-notch comfort and style.</p>
        </div>
    </section>

    <!-- Best Places You Can Visit With Us Section -->
    <section id="best-places">
        <h2>Best Places You Can Visit With Us</h2>
        <p>Explore some of the best destinations with Mega City Cab Service. Whether you're going for a relaxing getaway, business trip, or city exploration, we can take you there in comfort and style.</p>

        <!-- Place 1 -->
        <div class="place-item">
            <img src="images/13.jpg" alt="Beach">
            <h3>Beautiful Beaches</h3>
            <p>Enjoy stunning beach views and sunbathe on some of the world's most serene beaches.</p>
        </div>

        <!-- Place 2 -->
        <div class="place-item">
            <img src="images/14.jpg" alt="Mountains">
            <h3>Majestic Mountains</h3>
            <p>Take a scenic drive up the mountains and experience breathtaking views.</p>
        </div>

        <!-- Place 3 -->
        <div class="place-item">
            <img src="images/15.jpg" alt="City Tour">
            <h3>City Tours</h3>
            <p>Explore iconic landmarks and discover hidden gems in the heart of the city.</p>
        </div>

        <!-- Place 4 -->
        <div class="place-item">
            <img src="images/17.jpg" alt="Historical Sites">
            <h3>Historical Sites</h3>
            <p>Visit the ancient monuments and cultural heritage of the region.</p>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>

</body>
</html>
