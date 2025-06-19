<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About - WeatherNow</title>
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

        p {
            font-size: 1.1rem;
            line-height: 1.8;
            max-width: 800px;
            margin: auto;
        }

        ul {
            font-size: 1.1rem;
            text-align: left;
            margin: 20px auto;
            max-width: 800px;
        }

        ul li {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="header">
     <a href="weather.jsp" style="position: absolute; left: 15px; top: 10px; font-size: 32px; text-decoration: none; color: white;">🏠</a>            
    
        <h1>🌤️ About WeatherNow</h1>
    </div>

    <div class="content">
        <h2>What is WeatherNow?</h2>
        <p>
            WeatherNow is your go-to application for accurate, real-time weather forecasts and data. We provide weather information for cities across the globe, from temperature to humidity, wind speed, and more. 
        </p>

        <h2>Features</h2>
        <ul>
            <li>Real-time weather updates</li>
            <li>Detailed weather data (temperature, humidity, wind speed)</li>
            <li>Forecasts for any city worldwide</li>
            <li>Easy-to-use interface with a modern design</li>
        </ul>

        <h2>About Us</h2>
        <p>
            WeatherNow was developed by a passionate team of developers and weather enthusiasts. Our goal is to make weather data accessible and simple for everyone. We are constantly working to improve the app and bring new features to make your experience even better.
        </p>

        <h2>Why WeatherNow?</h2>
        <p>
            WeatherNow is a free weather forecasting website aimed at providing reliable weather information. Our mission is to give users the best, accurate weather data without any subscription fees. Whether you’re planning a trip, outdoor activities, or just curious about the weather, WeatherNow has you covered.
        </p>
    </div>

    <div class="footer">
        &copy; 2025 WeatherNow | Developed with ❤️ by Jisha Sree
    </div>
</body>
</html>
