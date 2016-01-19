class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :station_created_at
      t.decimal :temperature_in, precision: 3, scale: 1
      t.decimal :temperature_out, precision: 3, scale: 1
      t.integer :humidity_in
      t.integer :humidity_out
      t.decimal :pressure_absolute, precision: 6, scale: 2
      t.decimal :pressure_relative, precision: 6, scale: 2
      t.integer :wind_direction
      t.decimal :wind_speed, precision: 4, scale: 1
      t.decimal :wind_gust, precision: 4, scale: 1
      t.decimal :solar_radiation, precision: 6, scale: 2
      t.integer :solar_uv
      t.integer :solar_uvi
      t.decimal :rainfall_hourly, precision: 6, scale: 2
      t.decimal :rainfall_daily, precision: 6, scale: 2
      t.decimal :rainfall_weekly, precision: 6, scale: 2
      t.decimal :rainfall_monthly, precision: 6, scale: 2
      t.decimal :rainfall_yearly, precision: 6, scale: 2

      t.timestamps null: false
    end

    add_index :events, :created_at
    add_index :events, :station_created_at
  end
end
