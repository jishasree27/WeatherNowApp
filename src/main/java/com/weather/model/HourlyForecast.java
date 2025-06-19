package com.weather.model;

import com.fasterxml.jackson.annotation.JsonProperty;
public class HourlyForecast {

	  private long dt; 
	    private double temp; 

	    @JsonProperty("dt")
	    public long getDt() {
	        return dt;
	    }

	    public void setDt(long dt) {
	        this.dt = dt;
	    }

	    @JsonProperty("temp")
	    public double getTemp() {
	        return temp;
	    }

	    public void setTemp(double temp) {
	        this.temp = temp;
	    }
	}

