class ForecastsController < ApplicationController
  before_action :set_forecast, only: %i[show]

  # GET /forecasts/1
  def show
    @current_weather = @forecast.current_weather
    @forecast_days = @forecast.forecast_days
  end

  # GET /forecasts/new
  def new
    @forecast = Forecast.new
  end

  # POST /forecasts
  def create
    @forecast = Forecast.new(forecast_params.merge(date: Date.today))
    decode_address
    find_existing_forecast

    if @cached_forecast
      redirect_to @cached_forecast
    elsif @forecast.save
      redirect_to @forecast, notice: "Forecast was successfully created."
      # Only request weather data if forecast is saved successfully
      RequestWeatherData.new(@forecast).execute
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_forecast
    @forecast = Forecast.find(params[:id])
  end

  # Decode a given text address into latitude and longitude
  def decode_address
    @forecast.latitude, @forecast.longitude = Geocoder.search(@forecast.address).first.coordinates
  end

  # If existing forecast is found, redirect to it
  def find_existing_forecast
    @cached_forecast = Forecast.where(address: @forecast.address, date: Date.today.all_day)&.where("created_at > ?", Time.now - 30.minutes)&.first
  end

  # Only allow a list of trusted parameters through.
  def forecast_params
    params.require(:forecast).permit(:address)
  end
end
