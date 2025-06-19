<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Weather App</title>
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


        .header h1 {
            margin: 0;
            font-size: 2.5rem;
        }

        .content {
            flex: 1;
            padding: 50px 20px;
        }

       form {
    margin-top: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 12px;
    flex-wrap: wrap;
}

input[type="text"] {
    padding: 14px 20px;
    font-size: 1.1rem;
    width: 360px;
    border: none;
    border-radius: 12px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
    outline: none;
    transition: all 0.3s ease;
}

input[type="text"]:focus {
    box-shadow: 0 0 0 3px #b2dfdb;
}

input[type="submit"] {
    padding: 14px 24px;
    background: #26a69a;
    color: white;
    border: none;
    border-radius: 12px;
    font-size: 1.1rem;
    cursor: pointer;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
    transition: background 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #00796b;
}

        label {
            font-size: 1.2rem;
        }

     
        h2 {
            color: #00695c;
            margin-top: 30px;
        }

        p {
            font-size: 1.1rem;
        }

        p strong {
            color: #00897b;
        }

        .error {
            color: red;
            font-weight: bold;
        }

        .footer {
            background: #00897b;
            color: white;
            padding: 15px 0;
            font-size: 0.9rem;
        }
        @keyframes moveSideways {
    0%   { transform: translateX(0); }
    50%  { transform: translateX(50px); }
    100% { transform: translateX(0); }
}

.moving-image {
    animation: moveSideways 4s infinite ease-in-out;
}
.image-row {
    display: flex;
    justify-content: center;
    gap: 20px;
    flex-wrap: wrap;
    margin: 40px auto;
    max-width: 90%;
}

.image-row img {
    width: 22%;
    border-radius: 8px;
}
 .header {
    background: #4db6ac;
    color: white;
    padding: 20px 0;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
    position: relative;
    display: flex;
    justify-content: space-between; 
    align-items: center;
}

.nav-links {
    display: flex;
    gap: 20px;
    justify-content: flex-end; 
}

.nav-links a {
    text-decoration: none;
    color: white;
    font-size: 1.1rem;
    padding: 10px;
    border-radius: 8px;
    transition: background 0.3s ease;
}

.nav-links a:hover {
    background: #00796b;
}

        
    </style>
</head>

<body>
    <div class="header">
        <h1>🌤️ Weather Forecast</h1>
          <div class="nav-links">
            <a href="About.jsp">About</a>
            <a href="features.jsp">Features</a>
            <a href="privacypolicy.jsp">Privacy Policy</a>
        </div>
    </div>

    <div class="content">

    <h2>Check Live Weather Conditions Instantly!</h2>
    <p style="font-size: 1.1rem; max-width: 600px; margin: 0 auto 30px; line-height: 1.6;">
        Enter your city name below to get real-time weather updates including temperature, humidity, and forecast. 
        Stay informed and plan your day with confidence!
    </p>

    <form action="search" method="post">
        <label>Enter City:</label>
        <input type="text" name="city" required />
        <input type="submit" value="Get Weather" />
    </form>
    <c:if test="${not empty errorMessage}">
    <p style="color: red; font-weight: bold; margin-top: 20px;">
        ${errorMessage}
    </p>
</c:if>
    
</div>

        <div style="margin-top: 40px;">
         <img src="https://images.theconversation.com/files/442675/original/file-20220126-17-1i0g402.jpg?ixlib=rb-4.1.0&q=45&auto=format&w=1356&h=668&fit=crop" 
     alt="Weather Icon" 
     class="moving-image"
     style="width: 50%; margin-bottom: 20px;">


            <p style="font-size: 1.1rem; line-height: 1.8; max-width: 800px; margin: auto;">
                <strong>Welcome to WeatherNow Forecast!</strong> This website provides accurate, real-time weather information and forecasts for cities across the globe. Whether you're planning your next trip, scheduling an outdoor event, or simply deciding what to wear today, WeatherNow offers reliable temperature updates, humidity levels, wind speeds, and more at your fingertips.
                Understanding the climate is crucial for our daily lives. From scorching summer heatwaves to chilling winter storms, weather patterns influence everything from agriculture to health. Our climate is changing rapidly, and it's important to stay informed. With WeatherNow, you can monitor weather anomalies, seasonal trends, and prepare for unexpected shifts like sudden rainfall, drought, or extreme heat.
                Stay updated, stay safe, and make smart choices with our easy-to-use weather dashboard.
            </p>
        </div>
 
<div class="image-row">
    <img src="https://upload.wikimedia.org/wikipedia/commons/9/9b/Beautiful_summer_weather_in_Escanaba%2C_MI.jpg" alt="Weather Icon 1" class="moving-image">
    <img src="https://www.baltana.com/files/wallpapers-1/Spring-Latest-Wallpapers-02144.jpg" alt="Weather Icon 2" class="moving-image">
    <img src="https://static.vecteezy.com/system/resources/previews/029/771/613/non_2x/epicgraphy-shot-of-rainy-season-background-enjoying-nature-rainfall-and-happy-life-concept-generative-ai-free-photo.jpeg" alt="Weather Icon 3" class="moving-image">
    <img src="https://www.metoffice.gov.uk/binaries/content/gallery/metofficegovuk/hero-images/weather/sun/sun-setting-over-a-golden-field.jpg" alt="Weather Icon 4" class="moving-image">
</div>

    <div class="footer">
        &copy; 2025 Weather App | Made with ☀️ by Jisha
    </div>
</body>
</html>
