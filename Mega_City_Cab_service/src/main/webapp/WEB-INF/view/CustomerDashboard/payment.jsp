<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Payment</title>
    <script src="https://www.paypal.com/sdk/js?client-id=YOUR_PAYPAL_CLIENT_ID&currency=USD"></script>
    <style>
        body {
            background: url('images/1.jpg') center/cover no-repeat;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: rgba(0, 0, 0, 0.85);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 60%;
            padding: 40px;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h2 {
            font-size: 30px;
            color: #0070ba;
            margin-bottom: 25px;
        }
        .payment-details {
            margin-bottom: 20px;
        }
        .payment-details table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .payment-details th, .payment-details td {
            padding: 18px;
            text-align: left;
            font-size: 20px;
            border-bottom: 1px solid #ddd;
        }
        .payment-details th {
            background-color: #0070ba;
            color: white;
            border-radius: 5px;
        }
        .home-btn {
            display: inline-block;
            padding: 15px 30px;
            background: linear-gradient(135deg, #0070ba, #005ea6);
            color: white;
            text-decoration: none;
            font-size: 20px;
            font-weight: bold;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
            margin-bottom: 20px;
        }
        .home-btn:hover {
            background: linear-gradient(135deg, #005ea6, #004b8a);
            transform: scale(1.07);
        }
        .paypal-container {
            margin-top: 25px;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="index.jsp" class="home-btn">← Home</a>
        <h2>Secure Payment</h2>

        <c:if test="${not empty latestBill}">
            <div class="payment-details">
                <table>
                    <tr>
                        <th>Booking Number</th>
                        <td>${latestBill.bookingNumber}</td>
                    </tr>
                    <tr>
                        <th>Final Amount (USD)</th>
                        <td>$${latestBill.finalAmount}</td>
                    </tr>
                    <tr>
                        <th>Payment Status</th>
                        <td>${latestBill.paymentStatus}</td>
                    </tr>
                </table>
            </div>

            <div id="paypal-button-container" class="paypal-container"></div>

            <script>
                paypal.Buttons({
                    createOrder: function(data, actions) {
                        return actions.order.create({
                            purchase_units: [{
                                amount: {
                                    value: '${latestBill.finalAmount}'
                                }
                            }]
                        });
                    },
                    onApprove: function(data, actions) {
                        return actions.order.capture().then(function(details) {
                            alert('Transaction completed by ' + details.payer.name.given_name);
                            window.location.href = "paymentSuccess.jsp?orderID=" + data.orderID;
                        });
                    }
                }).render('#paypal-button-container');
            </script>
        </c:if>

        <c:if test="${empty latestBill}">
            <p style="font-size: 20px; color: red; font-weight: bold;">No payment details available. Please complete the booking process.</p>
        </c:if>
    </div>
</body>
</html>
