<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
  <title>Enhanced Weather Dashboard</title>
  
  <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
  <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>


  <style>
    body { font-family:'Segoe UI',sans-serif; background:#e0f2f1; margin:0; padding:20px; }
    .container { max-width:1200px; margin:auto;margin-top:200px; }
    h2,h3 { color:#37474f; margin-bottom:10px; }
  .section {
   max-width: 1500px;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  padding: 20px;
  margin: 40px auto; 
  max-width: 1000px;
}


    .weather-info {
      max-width: 1700px;
      display:grid;
      grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
      gap:20px;
      align-items:start;
    }
    .weather-item {
      
      background:#fafafa;
      border-radius:8px;
      box-shadow:0 2px 6px rgba(0,0,0,0.1);
      text-align:center;
      padding:15px;
      transition: transform 0.3s ease, background-color 0.3s ease;
    }
    .weather-item.main {
      grid-column:span 2;
      display:flex;
      align-items:center;
      gap:15px;
      justify-content:center;
 
      
    }
.weather-item:hover {
  transform: scale(1.05);
  background-color: #b2ebf2; 
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}
    .weather-item .icon { font-size:2em; margin-bottom:8px; }
    .weather-item.main img.icon { width:80px; height:80px; }
    .label { font-weight:600; color:#263238; margin-bottom:4px; }
    .value { font-size:1.2em; color:#455a64; }
    .desc { text-transform:capitalize; font-size:1em; color:#777; }

    .map-container iframe,
    #miniMap {
      width:100%;
      border-radius:12px;
      box-shadow:inset 0 0 10px rgba(0,0,0,0.05);
    }
    .map-container iframe { height:400px; }
    #miniMap { height:200px; margin-bottom:20px; }

    .charts { display:flex; flex-direction:column; gap:40px; }
    .chart-block {
      background:#fafafa;
      border-radius:12px;
      padding:20px;
      box-shadow:0 2px 8px rgba(0,0,0,0.05);
    }
    .chart-block h4 { margin-bottom:10px; color:#37474f; }
    canvas { width:100% !important; height:auto !important; }
    
      .threshold-table {
    width: 100%;
    border-collapse: collapse;
    font-family: Arial, sans-serif;
    margin: 20px 0;
  }

  .threshold-table th, .threshold-table td {
    border: 1px solid #ccc;
    padding: 8px 12px;
    text-align: center;
  }

  .threshold-table th {
    background-color: #f2f2f2;
  }

  .section-title {
    font-size: 1.4em;
    margin-top: 30px;
    color: #333;
  }

  .note {
    font-size: 0.9em;
    color: #666;
  }

  .emoji-label {
    font-weight: bold;
    font-size: 1.1em;
  }

  .highlight {
    background-color: #fffbe6;
    padding: 10px;
    border-left: 4px solid orange;
    margin-bottom: 20px;
  }
  .weather-container {
  max-width: 1500px;
  margin: 30px auto;
  padding: 25px;
  background-color: #f8f9fa;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  font-family: 'Segoe UI', sans-serif;
  color: #333;
}

.section-title {
  margin-top: 30px;
  color: #005f73;
  border-bottom: 2px solid #94d2bd;
  padding-bottom: 5px;
}

.threshold-table {
  width: 100%;
  border-collapse: collapse;
  margin: 10px 0 25px 0;
}

.threshold-table th,
.threshold-table td {
  border: 1px solid #ccc;
  padding: 8px 12px;
  text-align: center;
}

.threshold-table th {
  background-color: #e0fbfc;
  color: #023047;
  font-weight: 600;
}

.threshold-table tr:nth-child(even) {
  background-color: #f1f1f1;
}

    .threshold-table tr {
      transition: background-color 0.3s ease;
    }

    .threshold-table tr:hover {
      background-color: #ffd5cd; 
      cursor: pointer;
    }

.highlight {
  background-color: #ffe066;
  padding: 10px 15px;
  border-left: 5px solid #fab005;
  margin-bottom: 20px;
  border-radius: 5px;
}

.map-container {
max-width:1500px;
  height: 700px; 
}

.map-container iframe {
  max-width: 1500px;
  height: 600px; 
  max-width: 1500px;
  border: none;
}

.chart-block {
  height: 700px; 
   max-width: 1500px;
}

 #miniMap {
  height: 600px;
  max-width: 1500px;
  border: 1px solid #ccc;
}
  
  </style>
</head>
<body>
<header style="position: absolute; top: 0; left: 0; width: 100%; z-index: 1000;
                background:#80cbc4; color: white; padding: 1px; text-align: center;
                border-radius: 0 0 12px 12px; box-shadow: 0 2px 6px rgba(0,0,0,0.15);">
   <a href="weather.jsp" style="position: absolute; left: 15px; top: 10px; font-size: 32px; text-decoration: none; color: white;">🏠</a>            
  <h1>🌤️ WeatherNow Dashboard</h1>
  <p>Live Weather Updates & Forecasts</p>
</header>

  <div class="container">

    
    <div class="section weather-info">
      <h2>Weather in ${weather.name}, ${weather.sys.country}</h2>

      <div class="weather-item main">
        <img class="icon" src="http://openweathermap.org/img/wn/${weather.weather[0].icon}@4x.png"
             alt="${weather.weather[0].description}" />
        <div>
          <div class="label">${weather.weather[0].main}</div>
          <div class="value desc">${weather.weather[0].description}</div>
        </div>
      </div>

     
      <div class="weather-item">
        <div class="icon">📍</div>
        <div class="label">Latitude</div>
        <div class="value">${weather.coord.lat}</div>
      </div>
      <div class="weather-item">
        <div class="icon">📍</div>
        <div class="label">Longitude</div>
        <div class="value">${weather.coord.lon}</div>
      </div>

    
      <div class="weather-item">
        <div class="icon">🌡️</div>
        <div class="label">Temperature</div>
        <div class="value">${weather.main.temp} °C</div>
      </div>
      <div class="weather-item">
        <div class="icon">🤗</div>
        <div class="label">Feels Like</div>
        <div class="value">${weather.main.feelsLike} °C</div>
      </div>
      <div class="weather-item">
        <div class="icon">↕️</div>
        <div class="label">Min / Max</div>
        <div class="value">${weather.main.tempMin}°C / ${weather.main.tempMax}°C</div>
      </div>
      <div class="weather-item">
        <div class="icon">💧</div>
        <div class="label">Humidity</div>
        <div class="value">${weather.main.humidity}%</div>
      </div>
      <div class="weather-item">
        <div class="icon">🔽</div>
        <div class="label">Pressure</div>
        <div class="value">${weather.main.pressure} hPa</div>
      </div>
      <div class="weather-item">
        <div class="icon">🌬️</div>
        <div class="label">Wind</div>
        <div class="value">${weather.wind.speed} m/s @ ${weather.wind.deg}°</div>
      </div>
      <div class="weather-item">
        <div class="icon">💨</div>
        <div class="label">Wind Gust</div>
        <div class="value">${weather.wind.gust} m/s</div>
      </div>
      <div class="weather-item">
        <div class="icon">☁️</div>
        <div class="label">Cloudiness</div>
        <div class="value">${weather.clouds.all}%</div>
      </div>
      <div class="weather-item">
        <div class="icon">👁️</div>
        <div class="label">Visibility</div>
        <div class="value">${weather.visibility} m</div>
      </div>
      <div class="weather-item">
        <div class="icon">🌧️</div>
        <div class="label">Rain (1h/3h)</div>
        <div class="value">${weather.rain.oneHour} / ${weather.rain.threeHour} mm</div>
      </div>
      <div class="weather-item">
        <div class="icon">❄️</div>
        <div class="label">Snow (1h/3h)</div>
        <div class="value">${weather.snow.oneHour} / ${weather.snow.threeHour} mm</div>
      </div>
    </div>

    
    <div class="section map-container">
      <h3>Live Radar</h3>
      <iframe
        src="https://embed.windy.com/embed2.html?lat=${weather.coord.lat}&lon=${weather.coord.lon}"
        frameborder="0"></iframe>
    </div>

   
    <div class="section chart-block">
      <h4>Location Preview</h4>
      <div id="miniMap"></div>
    </div>

  </div>

  <script>
    //  mini-map
    const lat = ${weather.coord.lat}, lon = ${weather.coord.lon};
    const map = L.map('miniMap').setView([lat, lon], 8);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; OpenStreetMap'
    }).addTo(map);
    L.marker([lat, lon])
      .bindPopup('<strong>${weather.name}</strong><br/>' + lat.toFixed(3) + ', ' + lon.toFixed(3))
      .addTo(map).openPopup();

    

  
  </script>
  

<div class="highlight">
  <p><strong>Note:</strong> All values below represent general meteorological standards and safety thresholds for detecting extreme weather conditions.</p>
</div>
<div class="weather-container">


  <h2 class="section-title">🌡️ Temperature (°C)</h2>
  <table class="threshold-table">
    <tr><th>Type</th><th>Threshold</th></tr>
    <tr><td>Very Cold</td><td>Below 0°C</td></tr>
    <tr><td>Extreme Cold</td><td>Below -10°C</td></tr>
    <tr><td>Comfortable</td><td>18–27°C</td></tr>
    <tr><td>Hot</td><td>Above 30°C</td></tr>
    <tr><td>Extreme Heat</td><td>Above 40°C</td></tr>
  </table>

  <h2 class="section-title">🤗 Feels Like</h2>
  <p>Same thresholds as Temperature. Particularly important for human comfort:</p>
  <ul>
    <li>Feels like <strong>> 40°C</strong> = Dangerous heat</li>
    <li>Feels like <strong>< -10°C</strong> = Cold stress</li>
  </ul>

  <h2 class="section-title">💧 Humidity (%)</h2>
  <table class="threshold-table">
    <tr><th>Range</th><th>Description</th></tr>
    <tr><td>0–30%</td><td>Dry – dehydration risk</td></tr>
    <tr><td>30–60%</td><td>Ideal comfort</td></tr>
    <tr><td>60–80%</td><td>Humid</td></tr>
    <tr><td>80–100%</td><td>Extremely humid</td></tr>
  </table>

  <h2 class="section-title">🔽 Pressure (hPa)</h2>
  <table class="threshold-table">
    <tr><th>Pressure</th><th>Condition</th></tr>
    <tr><td>> 1030</td><td>High – Clear skies</td></tr>
    <tr><td>1013</td><td>Normal</td></tr>
    <tr><td>< 1000</td><td>Low – Cloudy/stormy</td></tr>
    <tr><td>< 980</td><td>Severe – Cyclone risk</td></tr>
  </table>

  <h2 class="section-title">🌬️ Wind Speed (m/s)</h2>
  <table class="threshold-table">
    <tr><th>Speed</th><th>Description</th></tr>
    <tr><td>< 5</td><td>Light breeze</td></tr>
    <tr><td>5–10</td><td>Moderate</td></tr>
    <tr><td>10–17</td><td>Strong – Caution</td></tr>
    <tr><td>> 20</td><td>Storm level</td></tr>
    <tr><td>> 30</td><td>Extreme wind – Hurricane</td></tr>
  </table>

  <h2 class="section-title">💨 Wind Gust (m/s)</h2>
  <ul>
    <li>> 15 m/s: Dangerous for hiking/flying</li>
    <li>> 25 m/s: Can uproot trees</li>
    <li>< 10–12 m/s: A normal or safe wind gust.</li>
  </ul>

  <h2 class="section-title">☁️ Cloudiness (%)</h2>
  <table class="threshold-table">
    <tr><th>Cloudiness</th><th>Description</th></tr>
    <tr><td>0–20%</td><td>Clear/Sunny</td></tr>
    <tr><td>20–60%</td><td>Partly Cloudy</td></tr>
    <tr><td>60–80%</td><td>Mostly Cloudy</td></tr>
    <tr><td>> 80%</td><td>Overcast</td></tr>
  </table>

  <h2 class="section-title">👁️ Visibility (m)</h2>
  <table class="threshold-table">
    <tr><th>Distance</th><th>Condition</th></tr>
    <tr><td>> 10,000</td><td>Excellent</td></tr>
    <tr><td>4,000–10,000</td><td>Good</td></tr>
    <tr><td>1,000–4,000</td><td>Moderate</td></tr>
    <tr><td>< 1,000</td><td>Poor – Fog/Rain</td></tr>
    <tr><td>< 200</td><td>Danger – Dense fog</td></tr>
  </table>

  <h2 class="section-title">🌧️ Rain (mm in 1h / 3h)</h2>
  <table class="threshold-table">
    <tr><th>Rainfall</th><th>Description</th></tr>
    <tr><td>0–2 mm</td><td>Light</td></tr>
    <tr><td>2–10 mm</td><td>Moderate</td></tr>
    <tr><td>10–30 mm</td><td>Heavy – Waterlogging</td></tr>
    <tr><td>> 30 mm</td><td>Very heavy – Flood risk</td></tr>
  </table>

  <h2 class="section-title">❄️ Snow (mm in 1h / 3h)</h2>
  <table class="threshold-table">
    <tr><th>Snowfall</th><th>Description</th></tr>
    <tr><td>0–5 mm</td><td>Light</td></tr>
    <tr><td>5–20 mm</td><td>Moderate</td></tr>
    <tr><td>> 20 mm/hr</td><td>Heavy – Road/Air issues</td></tr>
  </table>

  <h2 class="section-title">✅ Summary Table</h2>
  <table class="threshold-table">
    <tr><th>Metric</th><th>Min Extreme</th><th>Max Extreme</th></tr>
    <tr><td>Temperature</td><td>< -10°C</td><td>> 40°C</td></tr>
    <tr><td>Feels Like</td><td>< -10°C</td><td>> 40°C</td></tr>
    <tr><td>Humidity</td><td>< 30%</td><td>> 80%</td></tr>
    <tr><td>Pressure</td><td>< 980 hPa</td><td>> 1030 hPa</td></tr>
    <tr><td>Wind Speed</td><td>—</td><td>> 30 m/s</td></tr>
    <tr><td>Wind Gust</td><td>—</td><td>> 30 m/s</td></tr>
    <tr><td>Cloudiness</td><td>—</td><td>> 80%</td></tr>
    <tr><td>Visibility</td><td>< 1,000 m</td><td>—</td></tr>
    <tr><td>Rain</td><td>—</td><td>> 30 mm/hr</td></tr>
    <tr><td>Snow</td><td>—</td><td>> 20 mm/hr</td></tr>
  </table>
</div>



<footer style=" width: 100%; z-index: 1000;position:absolute;
               background: #80cbc4; color: white; text-align: center; padding: 15px;
               font-size: 0.9em;">
  <p>&copy; 2025 WeatherNow | Created by Jisha</p>
</footer>


</body>
</html>
