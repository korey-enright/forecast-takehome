class SaveCurrentWeather
  def initialize(forecast)
    @forecast = forecast
  end

  def execute
    current_weather = @forecast.api_response["current"]
    # Convert from Kelvin to Celsius and Fahrenheit and save
    @forecast.current_weather = CurrentWeather.new(
      temp_c: ConvertToCelsius.new(current_weather["temp"]).execute,
      temp_f: ConvertToFahrenheit.new(current_weather["temp"]).execute
    )
    @forecast.save
  end
end
