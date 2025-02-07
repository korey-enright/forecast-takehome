require "test_helper"

class ForecastsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_forecast_url
    assert_response :success
  end

  test "should create forecast" do
    assert_difference("Forecast.count") do
      post forecasts_url, params: { forecast: { address: "60660" } }
    end

    assert_redirected_to forecast_url(Forecast.last)
    assert_equal Forecast.last.address, "60660"
    assert_not_nil Forecast.last.current_weather
    assert_equal Forecast.last.forecast_days.count, 8
  end
end
