<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>City Not Found</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fce4ec;
            color: #c62828;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .error-box {
            background: #fff;
            border: 2px solid #ef9a9a;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .error-box h2 {
            margin: 0 0 15px;
            color: #d32f2f;
        }

        .home-button {
            background-color: #d32f2f;
            color: white;
            padding: 10px 20px;
            font-size: 1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
        }

        .home-button:hover {
            background-color: #b71c1c;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <h2>${errorMessage}</h2>
        <h3>City Not found or Enter Correct City Name</h3>
        <a href="weather.jsp" class="home-button">Go Back to Home</a>
    </div>
</body>
</html>
