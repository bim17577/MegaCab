<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Home</title>
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
        transition: 0.3s ease;
    }

    nav ul li a:hover {
        background: white;
        color: #ff4500;
    }

    /* Hero Section */
    #hero {
        background: url('images/3.jpg') no-repeat center center/cover;
        height: 60vh;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: white;
        flex-direction: column;
        padding: 20px;
        margin-top: 80px;
    }

    .hero-banner h1 {
        font-size: 3.5em;
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 3px;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        margin-bottom: 5px;
        color: black;
    }

    .hero-banner p {
        font-size: 1.5em;
        font-weight: 600;
        margin-bottom: 35px;
        color: black;
        text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.1);
    }

    .cta-btn {
        background: linear-gradient(90deg, #ff4500, #ff8c00);
        color: white;
        font-size: 1.3em;
        padding: 12px 24px;
        text-decoration: none;
        border-radius: 8px;
        margin-top: 35px;
        display: inline-block;
        font-weight: bold;
        box-shadow: 0px 4px 12px rgba(255, 69, 0, 0.4);
        transition: transform 0.3s ease, background-color 0.3s ease, box-shadow 0.3s ease;
    }

    .cta-btn:hover {
        background: white;
        color: #ff4500;
        border: 2px solid #ff4500;
        transform: scale(1.1);
        box-shadow: 0px 8px 16px rgba(255, 69, 0, 0.6);
    }

    /* Info Section */
    #info {
        padding: 50px 20px;
        background-color: #fff;
        text-align: center;
    }

    #info .info-box {
        max-width: 800px;
        margin: auto;
        background: #ff4500;
        padding: 30px;
        color: white;
        border-radius: 15px;
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
    }

    #info h2 {
        font-size: 2.5em;
        margin-bottom: 15px;
    }

    #info p {
        font-size: 1.1em;
        line-height: 1.6;
    }

    /* Enhanced Card Section */
    .card-container {
        display: flex;
        justify-content: center;
        gap: 30px;
        margin-top: 50px;
        flex-wrap: wrap;
        padding: 20px;
    }

   .card {
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
    width: 280px;
    padding: 30px;
    text-align: center;
    border: 2px solid #ff4500; /* Add a border color here */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    position: relative;
}
   

    .card i {
        font-size: 3.5em;
        color: #ff4500;
        margin-bottom: 20px;
        transition: color 0.3s ease;
    }

    .card h3 {
        font-size: 1.8em;
        color: #ff4500;
        margin-bottom: 10px;
    }

    .card p {
        font-size: 1.1em;
        color: #333;
        margin-bottom: 20px;
    }

    .card:hover {
        transform: translateY(-15px);
        box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
    }

    .card:hover i {
        color: #ff8c00;
    }

    .card .card-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.2);
        border-radius: 15px;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .card:hover .card-overlay {
        opacity: 1;
    }
    /* Best Places Section */
#places {
    padding: 50px 20px;
    text-align: center;
    background-color: #fff;
}

#places h2 {
    font-size: 2.2em;
    margin-bottom: 30px;
    color: #ff4500;
    font-weight: bold;
}

#places p {
    font-size: 1.1em;
    margin-bottom: 40px;
    line-height: 1.6;
    color: #333;
}

/* Place Item Styles */
.place-item {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 80%;
    background-color: #ff4500;
    color: white;
    border-radius: 12px;
    padding: 30px;
    margin-bottom: 25px;
    position: relative;
    overflow: hidden;
    transition: transform 0.4s ease, box-shadow 0.4s ease;
    margin-left: auto;
    margin-right: auto;
}

.place-item i {
    font-size: 3em;
    margin-right: 20px;
    transition: transform 0.3s ease;
}

.place-item .place-content {
    text-align: left;
}

.place-item .place-content h3 {
    font-size: 1.8em;
    margin-bottom: 10px;
    font-weight: bold;
}

.place-item .place-content p {
    font-size: 1em;
    margin-bottom: 15px;
}

.place-item:hover {
    transform: translateY(-8px);
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
    background-color: #f2f2f2; /* Light color for hover effect */
}

.place-item:hover i {
    transform: scale(1.15);
}

.place-item:hover .place-content h3 {
    color: #ff8c00;
}

.place-item:hover .place-content p {
    opacity: 0.8;
}

/* Hover Background Effect */
.place-item:before {
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

.place-item:hover:before {
    opacity: 1;
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

    <!-- Hero Section -->
    <section id="hero">
        <div class="hero-banner">
            <h1>Mega City Cab Service</h1>
            <p>Your Ride, Our Priority. Fast and Reliable Cab Service</p>
            <a href="customer?action=add" class="cta-btn">Book a Ride</a>
        </div>
    </section>

    <!-- Information Section -->
    <section id="info">
        <div class="info-box">
            <h2>Why Choose Mega City Cab?</h2>
            <p>We provide the best cab services in the city with an easy-to-use booking system. Our drivers are professional, and we prioritize customer safety and comfort. Book your ride with us today!</p>
        </div>

        <!-- Enhanced Card Section with Icons -->
        <div class="card-container">
            <div class="card">
                <i class="fas fa-taxi"></i>
                <h3>Fast Booking</h3>
                <p>Book your cab in minutes with our easy-to-use online system.</p>
                <div class="card-overlay"></div>
            </div>
            <div class="card">
                <i class="fas fa-users"></i>
                <h3>Experienced Drivers</h3>
                <p>Our drivers are experienced, professional, and dedicated to your safety.</p>
                <div class="card-overlay"></div>
            </div>
            <div class="card">
                <i class="fas fa-clock"></i>
                <h3>24/7 Service</h3>
                <p>We provide round-the-clock services to ensure you're never stranded.</p>
                <div class="card-overlay"></div>
            </div>
            <!-- Additional Cards -->
            <div class="card">
                <i class="fas fa-check-circle"></i>
                <h3>Easy Payment</h3>
                <p>Multiple payment options for a smooth experience.</p>
                <div class="card-overlay"></div>
            </div>
            <div class="card">
                <i class="fas fa-map-marker-alt"></i>
                <h3>Reliable Locations</h3>
                <p>We cover all major city areas, so you're never too far from a ride.</p>
                <div class="card-overlay"></div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab Service | All Rights Reserved</p>
    </footer>

</body>
</html>
