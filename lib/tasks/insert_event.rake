namespace :events do
  task :insert => :environment do
    require 'wh2600'

    wh = Wh2600.new('172.25.26.63')
    data = wh.get_data
    event = Event.new
    event.station_created_at = data['station_datetime']
    event.temperature_in = data['temperature']['in']
    event.temperature_out = data['temperature']['out']
    event.humidity_in = data['humidity']['in']
    event.humidity_out = data['humidity']['out']
    event.pressure_absolute = data['pressure']['absolute']
    event.pressure_relative = data['pressure']['relative']
    event.wind_direction = data['wind']['direction']
    event.wind_speed = data['wind']['speed']
    event.wind_gust = data['wind']['gust']
    event.solar_radiation = data['solar']['radiation']
    event.solar_uv = data['solar']['uv']
    event.solar_uvi = data['solar']['uvi']
    event.rainfall_hourly = data['rainfall']['hourly']
    event.rainfall_daily = data['rainfall']['daily']
    event.rainfall_weekly = data['rainfall']['weekly']
    event.rainfall_monthly = data['rainfall']['monthly']
    event.rainfall_yearly = data['rainfall']['yearly']
    event.save
  end
end
