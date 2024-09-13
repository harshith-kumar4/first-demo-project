<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        h1 {
            color: #007bff;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Order Management System</h1>
        
        <!-- Link to Add a New Order -->
        <a href="addOrder.jsp" class="button">Add New Order</a>
        
        <!-- Link to Display All Orders -->
        <a href="displayOrder.jsp" class="button">View All Orders</a>

    </div>

</body>
</html>
