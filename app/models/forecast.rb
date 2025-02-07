class Forecast < ApplicationRecord
  has_one :current_weather, dependent: :destroy
  has_many :forecast_days, dependent: :destroy
end
