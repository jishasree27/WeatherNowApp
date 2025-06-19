<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Weather Forecast</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    .container { display: flex; justify-content: space-between; }
    .chart-container { width: 65%; height: 400px; }
    .forecast-list { width: 30%; }
    .forecast-item { display: flex; align-items: center; justify-content: space-between; margin-bottom: 12px; }
    .forecast-item img { width: 40px; }
    .temp { font-weight: bold; }
    canvas { background-color: #fff; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
  </style>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<h2>Hourly forecast</h2>
<div class="container">
  <div class="chart-container">
    <canvas id="hourlyChart"></canvas>
  </div>

  <div class="forecast-list">
    <h2>8-day forecast</h2>
    <div id="dailyForecast"></div>
  </div>
</div>

<script>
  const apiKey = "27d844f08a1f7d71519d97444c6fde49";
  const lat = 11.0168;  // example: Coimbatore
  const lon = 76.9558;

  fetch(`https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&exclude=minutely,alerts&units=metric&appid=${apiKey}`)
    .then(response => response.json())
    .then(data => {
      const hourly = data.hourly.slice(0, 9); // next 9 hours
      const daily = data.daily.slice(0, 8);    // next 8 days

      // HOURLY CHART DATA
      const hLabels = hourly.map(h => new Date(h.dt * 1000).getHours() + "h");
      const hTemp = hourly.map(h => h.temp);
      const hPop = hourly.map(h => Math.round(h.pop * 100));

      new Chart(document.getElementById('hourlyChart').getContext('2d'), {
        type: 'bar',
        data: {
          labels: hLabels,
          datasets: [
            {
              type: 'line',
              label: 'Temp (°C)',
              data: hTemp,
              borderColor: '#e57373',
              backgroundColor: 'transparent',
              yAxisID: 'y',
              tension: 0.4
            },
            {
              type: 'bar',
              label: 'Precip (%)',
              data: hPop,
              backgroundColor: '#64b5f6',
              yAxisID: 'y1'
            }
          ]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            y: {
              position: 'left',
              title: { display: true, text: '°C' }
            },
            y1: {
              position: 'right',
              title: { display: true, text: '%' },
              grid: { drawOnChartArea: false }
            }
          }
        }
      });

      // DAILY FORECAST LIST
      const forecastContainer = document.getElementById('dailyForecast');
      daily.forEach(day => {
        const date = new Date(day.dt * 1000);
        const dayStr = date.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' });
        const iconUrl = `http://openweathermap.org/img/wn/${day.weather[0].icon}.png`;
        const weather = day.weather[0].description;
        const max = Math.round(day.temp.max);
        const min = Math.round(day.temp.min);

        forecastContainer.innerHTML += `
          <div class="forecast-item">
            <div>
              <div>${dayStr}</div>
              <div class="temp">${max} / ${min}°C</div>
            </div>
            <img src="${iconUrl}" alt="${weather}">
            <div>${weather}</div>
          </div>
        `;
      });
    })
    .catch(err => console.error("Weather API error:", err));
</script>

</body>
</html>
