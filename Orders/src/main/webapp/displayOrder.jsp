<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.entities.Order" %>
<%@ page import="com.entities.OrderItem" %>
<%@ page import="com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Orders</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            background-color: white;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px 20px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
            font-size: 1.1em;
            letter-spacing: 1px;
        }
        td {
            font-size: 1em;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9f3ff;
            transition: 0.2s ease;
        }
        .total-price {
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
            font-size: 1.2em;
            color: #444;
        }
        .total-price span {
            color: #007bff;
        }
        .container {
            text-align: center;
            margin-top: 30px;
        }
        a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            font-size: 1.1em;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Order List</h1>

    <table>
        <tr>
            <th>Order ID</th>
            <th>Total Price</th>
        </tr>
        
        <% 
            Session session1 = FactoryProvider.getFactory().openSession();
            List<Order> orders = session1.createQuery("FROM Order").list();
            session1.beginTransaction();

            int grandTotal = 0; // Variable to store total price of all orders
            
            for (Order order : orders) {
                int totalPrice = 0;
                for (OrderItem item : order.getItems()) {
                    totalPrice += item.getPrice();
                }
                grandTotal += totalPrice; // Add the order's total price to grand total
        %>
                <tr>
                    <td><%= order.getOrderId() %></td>
                    <td><%= totalPrice %></td>
                </tr>
        <% 
            }
            session1.getTransaction().commit();
            session1.close();
        %>
    </table>
    
    <!-- Display total price of all orders -->
    <div class="total-price">
        Total Price of All Orders: <span><%= grandTotal %></span>
    </div>

    <div class="container">
        <a href="index.jsp">Go to Home</a>
    </div>
</body>
</html>
