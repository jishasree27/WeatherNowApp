const apiKey = '27d844f08a1f7d71519d97444c6fde49';  // Replace with your actual API key
const lat = '51.5074';  // Latitude for London
const lon = '-0.1278';  // Longitude for London

fetch(`https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&exclude=minutely,alerts&units=metric&appid=${apiKey}`)
  .then(response => response.json())
  .then(data => {
    console.log('API Data:', data);  // Log the full API response to check structure

    // Check if hourly data exists
    if (data && data.hourly) {
      const hourlyData = data.hourly.slice(0, 12); 
      const hourlyTemperatures = hourlyData.map(item => item.temp);
      const hourlyLabels = hourlyData.map(item => {
        const date = new Date(item.dt * 1000);
        return `${date.getHours()}:00`;
      });
      
      // Hourly Forecast Chart
      const hourlyChartCtx = document.getElementById('chart-component').getContext('2d');
      if (hourlyTemperatures.length > 0) {
        new Chart(hourlyChartCtx, {
          type: 'line',
          data: {
            labels: hourlyLabels,
            datasets: [{
              label: 'Temperature (°C)',
              data: hourlyTemperatures,
              borderColor: 'rgba(75, 192, 192, 1)',
              fill: false
            }]
          },
          options: {
            responsive: true,
            scales: {
              x: { title: { display: true, text: 'Time' } },
              y: { title: { display: true, text: 'Temperature (°C)' } }
            }
          }
        });
      }
    } else {
      console.error('Hourly data not available.');
    }

    // Check if daily data exists
    if (data && data.daily) {
      const dailyData = data.daily.slice(0, 8);
      const dailyTemperatures = dailyData.map(item => item.temp.day);
      const dailyLabels = dailyData.map(item => {
        const date = new Date(item.dt * 1000);
        return date.toLocaleDateString();
      });

      // 8-Day Forecast Chart
      const dailyChartCtx = document.getElementById('dailyChart').getContext('2d');
      if (dailyTemperatures.length > 0) {
        new Chart(dailyChartCtx, {
          type: 'bar',
          data: {
            labels: dailyLabels,
            datasets: [{
              label: 'Temperature (°C)',
              data: dailyTemperatures,
              backgroundColor: 'rgba(153, 102, 255, 0.2)',
              borderColor: 'rgba(153, 102, 255, 1)',
              borderWidth: 1
            }]
          },
          options: {
            responsive: true,
            scales: {
              x: { title: { display: true, text: 'Day' } },
              y: { title: { display: true, text: 'Temperature (°C)' } }
            }
          }
        });
      }
    } else {
      console.error('Daily data not available.');
    }
  })
  .catch(error => {
    console.error('Error fetching data:', error);
  });
