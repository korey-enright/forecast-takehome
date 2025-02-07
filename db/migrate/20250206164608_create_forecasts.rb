class CreateForecasts < ActiveRecord::Migration[7.1]
  def change
    create_table :forecasts do |t|
      t.string :latitude
      t.string :longitude
      t.datetime :date
      t.string :address
      t.string :forecast_length
      t.json :api_response

      t.timestamps
    end
  end
end
