class SaveForecastData
  def initialize(forecast)
    @forecast = forecast
  end

  def execute
    daily = @forecast.api_response["daily"]
    # Convert from Kelvin to Celsius and Fahrenheit and save for each day
    daily.each do |day|
      temp = day["temp"]
      @forecast.forecast_days.create(
        date: day["dt"].to_date,
        min_temp_c: ConvertToCelsius.new(temp["min"]).execute,
        min_temp_f: ConvertToFahrenheit.new(temp["min"]).execute,
        max_temp_c: ConvertToCelsius.new(temp["max"]).execute,
        max_temp_f: ConvertToFahrenheit.new(temp["max"]).execute,
        avg_temp_c: ConvertToCelsius.new(temp["day"]).execute,
        avg_temp_f: ConvertToFahrenheit.new(temp["day"]).execute
      )
    end
    @forecast.save
  end
end
