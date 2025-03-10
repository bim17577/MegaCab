<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
        background: url('images/1.jpg') center/cover no-repeat;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h2 {
            text-align: center;
        }
        .payment-details {
            margin-top: 30px;
        }
        .payment-details table {
            width: 100%;
            border-collapse: collapse;
        }
        .payment-details table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: right;
        }
        th {
            background-color: #f1f1f1;
        }
        td {
            background-color: #f9f9f9;
        }
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Payment Details</h2>

        <c:if test="${not empty latestBill}">
            <div class="payment-details">
                <table>
                    <tr>
                        <th>Booking Number</th>
                        <td>${latestBill.bookingNumber}</td>
                    </tr>
                    <tr>
                        <th>Total Fare</th>
                        <td>${latestBill.totalFare}</td>
                    </tr>
                    <tr>
                        <th>Tax Amount</th>
                        <td>${latestBill.taxAmount}</td>
                    </tr>
                    <tr>
                        <th>Discount</th>
                        <td>${latestBill.discount}</td>
                    </tr>
                    <tr>
                        <th>Final Amount</th>
                        <td>${latestBill.finalAmount}</td>
                    </tr>
                    <tr>
                        <th>Payment Method</th>
                        <td>${latestBill.paymentMethod}</td>
                    </tr>
                    <tr>
                        <th>Payment Status</th>
                        <td>${latestBill.paymentStatus}</td>
                    </tr>
                </table>
            </div>

            <form action="processPayment" method="post">
                <!-- Add any necessary payment details form fields here -->
                <input type="hidden" name="bookingNumber" value="${latestBill.bookingNumber}">
                <input type="hidden" name="finalAmount" value="${latestBill.finalAmount}">
                <button type="submit" class="btn">Proceed to Payment</button>
            </form>
        </c:if>

        <c:if test="${empty latestBill}">
            <p>No payment details available. Please make sure you have completed the booking process.</p>
        </c:if>

    </div>

</body>
</html>
