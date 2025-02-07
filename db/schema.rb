# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_02_06_165032) do
  create_table "current_weathers", force: :cascade do |t|
    t.integer "forecast_id", null: false
    t.string "temp_f"
    t.string "temp_c"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forecast_id"], name: "index_current_weathers_on_forecast_id"
  end

  create_table "forecast_days", force: :cascade do |t|
    t.integer "forecast_id", null: false
    t.datetime "date"
    t.string "max_temp_f"
    t.string "max_temp_c"
    t.string "min_temp_f"
    t.string "min_temp_c"
    t.string "avg_temp_f"
    t.string "avg_temp_c"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forecast_id"], name: "index_forecast_days_on_forecast_id"
  end

  create_table "forecasts", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.datetime "date"
    t.string "address"
    t.string "forecast_length"
    t.json "api_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "current_weathers", "forecasts"
  add_foreign_key "forecast_days", "forecasts"
end
