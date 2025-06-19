package com.weather.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;

public class WeatherResponse {

    private Sys sys;
    private String name;
    private Coord coord;
    private Main main;
    private Wind wind;
    private Clouds clouds;
    private Rain rain;
    private Snow snow;
    private List<Weather> weather;
    private Integer visibility;
    private Long dt;
    private Integer timezone;
    
    private List<HourlyForecast> hourly;

    @JsonProperty("hourly")
    public List<HourlyForecast> getHourly() {
        return hourly;
    }

    public void setHourly(List<HourlyForecast> hourly) {
        this.hourly = hourly;
    }


   
    public static class Sys {
        private String country;
        public String getCountry() { return country; }
        public void setCountry(String country) { this.country = country; }
    }
    public Sys getSys() { return sys; }
    public void setSys(Sys sys) { this.sys = sys; }


    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

  
    public static class Coord {
        private Double lat;
        private Double lon;
        public Double getLat() { return lat; }
        public void setLat(Double lat) { this.lat = lat; }
        public Double getLon() { return lon; }
        public void setLon(Double lon) { this.lon = lon; }
    }
    public Coord getCoord() { return coord; }
    public void setCoord(Coord coord) { this.coord = coord; }

  
    public static class Main {
        private Double temp;
        @JsonProperty("temp_min")    private Double tempMin;
        @JsonProperty("temp_max")    private Double tempMax;
        @JsonProperty("feels_like") private Double feelsLike;
        @JsonProperty("dew_point")  private Double dewPoint;
        private Integer pressure;
        private Integer humidity;

        public Double getTemp() { return temp; }
        public void setTemp(Double temp) { this.temp = temp; }
        public Double getTempMin() { return tempMin; }
        public void setTempMin(Double tempMin) { this.tempMin = tempMin; }
        public Double getTempMax() { return tempMax; }
        public void setTempMax(Double tempMax) { this.tempMax = tempMax; }
        public Double getFeelsLike() { return feelsLike; }
        public void setFeelsLike(Double feelsLike) { this.feelsLike = feelsLike; }
        public Double getDewPoint() { return dewPoint; }
        public void setDewPoint(Double dewPoint) { this.dewPoint = dewPoint; }
        public Integer getPressure() { return pressure; }
        public void setPressure(Integer pressure) { this.pressure = pressure; }
        public Integer getHumidity() { return humidity; }
        public void setHumidity(Integer humidity) { this.humidity = humidity; }
    }
    public Main getMain() { return main; }
    public void setMain(Main main) { this.main = main; }

  
    public static class Wind {
        private Double speed;
        private Integer deg;
        private Double gust;
        public Double getSpeed() { return speed; }
        public void setSpeed(Double speed) { this.speed = speed; }
        public Integer getDeg() { return deg; }
        public void setDeg(Integer deg) { this.deg = deg; }
        public Double getGust() { return gust; }
        public void setGust(Double gust) { this.gust = gust; }
    }
    public Wind getWind() { return wind; }
    public void setWind(Wind wind) { this.wind = wind; }

   
    public static class Clouds {
        private Integer all;
        public Integer getAll() { return all; }
        public void setAll(Integer all) { this.all = all; }
    }
    public Clouds getClouds() { return clouds; }
    public void setClouds(Clouds clouds) { this.clouds = clouds; }

    
    public static class Rain {
        @JsonProperty("1h") private Double oneHour;
        @JsonProperty("3h") private Double threeHour;
        public Double getOneHour() { return oneHour; }
        public void setOneHour(Double oneHour) { this.oneHour = oneHour; }
        public Double getThreeHour() { return threeHour; }
        public void setThreeHour(Double threeHour) { this.threeHour = threeHour; }
    }
    public Rain getRain() { return rain; }
    public void setRain(Rain rain) { this.rain = rain; }

 
    public static class Snow {
        @JsonProperty("1h") private Double oneHour;
        @JsonProperty("3h") private Double threeHour;
        public Double getOneHour() { return oneHour; }
        public void setOneHour(Double oneHour) { this.oneHour = oneHour; }
        public Double getThreeHour() { return threeHour; }
        public void setThreeHour(Double threeHour) { this.threeHour = threeHour; }
    }
    public Snow getSnow() { return snow; }
    public void setSnow(Snow snow) { this.snow = snow; }

    public static class Weather {
        private Integer id;
        private String main;
        private String description;
        private String icon;
        public Integer getId() { return id; }
        public void setId(Integer id) { this.id = id; }
        public String getMain() { return main; }
        public void setMain(String main) { this.main = main; }
        public String getDescription() { return description; }
        public void setDescription(String description) { this.description = description; }
        public String getIcon() { return icon; }
        public void setIcon(String icon) { this.icon = icon; }
    }
    public List<Weather> getWeather() { return weather; }
    public void setWeather(List<Weather> weather) { this.weather = weather; }

    
    public Integer getVisibility() { return visibility; }
    public void setVisibility(Integer visibility) { this.visibility = visibility; }
    public Long getDt() { return dt; }
    public void setDt(Long dt) { this.dt = dt; }
    public Integer getTimezone() { return timezone; }
    public void setTimezone(Integer timezone) { this.timezone = timezone; }
}
