<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Features - WeatherNow</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #e0f2f1;
            text-align: center;
            padding: 0;
            margin: 0;
            color: #333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .header {
            background: #4db6ac;
            color: white;
            padding: 20px 0;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
        }

        .header h1 {
            margin: 0;
            font-size: 2.5rem;
        }

        .content {
            flex: 1;
            padding: 50px 20px;
        }

        .footer {
            background: #00897b;
            color: white;
            padding: 15px 0;
            font-size: 0.9rem;
        }

        h2 {
            color: #00695c;
            margin-top: 30px;
        }

        .features-list {
            list-style-type: none;
            padding: 0;
            font-size: 1.2rem;
            line-height: 1.8;
        }

        .features-list li {
            margin: 10px 0;
            padding-left: 20px;
        }

        .features-list li::before {
            content: "✔️";
            padding-right: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
     <a href="weather.jsp" style="position: absolute; left: 15px; top: 10px; font-size: 32px; text-decoration: none; color: white;">🏠</a>            
    
        <h1>🌟 Features of WeatherNow</h1>
    </div>

    <div class="content">
        <h2>Why Choose WeatherNow?</h2>
        <ul class="features-list">
            <li>Real-Time Weather: Get accurate and up-to-date weather forecasts for any city worldwide.</li>
            <li>Detailed Forecast: Includes temperature, humidity, wind speed, and more!</li>
            <li>Global Coverage: Supports any city or country, making it a global app.</li>
            <li>User-Friendly Interface: A simple, clean design for an intuitive experience.</li>
            <li>Instant Updates: Check weather conditions anytime with fast results.</li>
            <li>Easy to Use: Just enter the city and get all the details in a few seconds.</li>
        </ul>
    </div>

    <div class="footer">
        &copy; 2025 WeatherNow | Features to keep you updated with the best weather information!
    </div>
</body>
</html>
