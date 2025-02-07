class CreateForecastDays < ActiveRecord::Migration[7.1]
  def change
    create_table :forecast_days do |t|
      t.references :forecast, null: false, foreign_key: true
      t.datetime :date
      t.string :max_temp_f
      t.string :max_temp_c
      t.string :min_temp_f
      t.string :min_temp_c
      t.string :avg_temp_f
      t.string :avg_temp_c

      t.timestamps
    end
  end
end
