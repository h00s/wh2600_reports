json.array!(@events) do |event|
  json.extract! event, :id, :station_created_at, :temperature_in, :temperature_out, :humidity_in, :humidity_out, :pressure_absolute, :pressure_relative, :wind_direction, :wind_speed, :wind_gust, :solar_radiation, :solar_uv, :solar_uvi, :rainfall_hourly, :rainfall_daily, :rainfall_weekly, :rainfall_monthly, :rainfall_yearly
  json.url event_url(event, format: :json)
end
