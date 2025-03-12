# Mega City Cab Service System

## Description
Mega City Cab is a popular cab service in Colombo City, serving thousands of customers each month. Currently, the system manages customer orders and details manually. This computerized system aims to streamline operations by automating customer bookings, managing booking information, and calculating bills. 

The system allows users to:
- Register new customers.
- Manage customer orders.
- Calculate and print bills.
- Manage car and driver information.
- Provide proper system authentication and secure login.
- Generate detailed customer booking reports.

## Features
- **Authentication:** Secure login system using username and password for access.
- **Customer Booking Management:** Add new customer bookings with details such as customer name, address, phone number, destination, and booking number.
- **Booking Details:** View and display customer order details.
- **Bill Calculation:** Calculate the total amount for a customer’s ride based on booking number, including applicable taxes or discounts.
- **Car and Driver Management:** Manage car details and driver assignments to bookings.
- **Help Menu:** Provides system usage guidelines for new users.
- **Exit:** Log out and properly close the system.

## Installation
1. Clone this repository:
```bash
git clone https://github.com/bim17577/MegaCab.git
```

2. Navigate to the project directory:
```bash
cd megacitycab
```

3. Compile and run the program:
```bash
javac Main.java
java Main
```

This will start the program and present the menu for interacting with the system.

## Usage
Upon starting the program, users will be prompted to log in using a valid username and password. Once authenticated, users can:
- **Add a new booking:** Enter customer details such as name, address, phone number, and destination.
- **View booking details:** View the order and customer details of any booking.
- **Calculate and print bill:** View the total fare, taxes, and discounts for a specific booking.
- **Manage car and driver information:** Add or update car and driver details.
- **Help:** View the system usage guidelines.
- **Exit:** Log out from the system.

## Version History
- **v1.0**: Initial commit project.
- **v2**: Add Booking section.
- **v3**: Add booking java.
- **v4**: remove fare amount in booking.
- - **v5**: Adding test classes for the development.
- **v6**: Add bill section.
- - **v7**: Add images.
 - - **v8**: Add login test.

## Contributing
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes and commit them (`git commit -am 'Add feature'`).
4. Push your changes to the branch (`git push origin feature-name`).
5. Create a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
