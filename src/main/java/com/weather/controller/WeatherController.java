package com.weather.controller; 
import com.weather.model.WeatherResponse;
 import com.weather.service.WeatherService; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.GetMapping; 
import org.springframework.web.bind.annotation.PostMapping; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestParam; import org.springframework.web.client.HttpClientErrorException;
 @Controller
 public class WeatherController {
 @Autowired 
private WeatherService weatherService; 
@GetMapping("/") 
public String showForm() {
 return "weather"; 
}
 @RequestMapping("/search") 
public String showWeatherPage(@RequestParam("city") String city, Model model) { 
if (city.equalsIgnoreCase("india")) 
{ city = "New Delhi,in"; 
} 
try { 
WeatherResponse weatherResponse = weatherService.getWeather(city); model.addAttribute("weather", weatherResponse); return "result"; 
} catch (HttpClientErrorException e) { 
model.addAttribute("errorMessage", "❌ No such city is available"); return "weather"; } 
} 
 @PostMapping("weatherCheckingAPI/search") 
public String searchWeather(@RequestParam("city") String city, Model model) 
{
 WeatherResponse weatherResponse = weatherService.getWeather(city); 
model.addAttribute("weather", weatherResponse); return "result"; } 
} 