class RequestWeatherData
  def initialize(forecast)
    @latitude = forecast.latitude
    @longitude = forecast.longitude
    @forecast = forecast
  end

  def execute
    client = OpenWeather::Client.new(
      api_key: Rails.application.credentials.open_weather.api_key
    )
    # One Call API excludes minutely, hourly, and alerts data, just get daily forecast
    @forecast.api_response = client.one_call(lat: @latitude, lon: @longitude, exclude: ["minutely", "hourly", "alerts"])
    @forecast.save
    # Save current weather and forecast data
    SaveCurrentWeather.new(@forecast).execute
    SaveForecastData.new(@forecast).execute
  end
end
