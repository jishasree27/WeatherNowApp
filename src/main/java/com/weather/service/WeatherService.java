
package com.weather.service;
 import com.weather.model.WeatherResponse;
 import org.springframework.stereotype.Service; 
import org.springframework.web.client.RestTemplate; 
@Service
 public class WeatherService {
 private final String API_KEY = "27d844f08a1f7d71519d97444c6fde49"; 
public WeatherResponse getWeather(String city) {
 String url = "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + API_KEY + "&units=metric";
 RestTemplate restTemplate = new RestTemplate(); 
return restTemplate.getForObject(url, WeatherResponse.class); 
} 
}