# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160119000221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "station_created_at"
    t.decimal  "temperature_in",     precision: 3, scale: 1
    t.decimal  "temperature_out",    precision: 3, scale: 1
    t.integer  "humidity_in"
    t.integer  "humidity_out"
    t.decimal  "pressure_absolute",  precision: 6, scale: 2
    t.decimal  "pressure_relative",  precision: 6, scale: 2
    t.integer  "wind_direction"
    t.decimal  "wind_speed",         precision: 4, scale: 1
    t.decimal  "wind_gust",          precision: 4, scale: 1
    t.decimal  "solar_radiation",    precision: 6, scale: 2
    t.integer  "solar_uv"
    t.integer  "solar_uvi"
    t.decimal  "rainfall_hourly",    precision: 6, scale: 2
    t.decimal  "rainfall_daily",     precision: 6, scale: 2
    t.decimal  "rainfall_weekly",    precision: 6, scale: 2
    t.decimal  "rainfall_monthly",   precision: 6, scale: 2
    t.decimal  "rainfall_yearly",    precision: 6, scale: 2
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "events", ["created_at"], name: "index_events_on_created_at", using: :btree
  add_index "events", ["station_created_at"], name: "index_events_on_station_created_at", using: :btree

end
