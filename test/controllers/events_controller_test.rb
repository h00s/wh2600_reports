require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { humidity_in: @event.humidity_in, humidity_out: @event.humidity_out, pressure_absolute: @event.pressure_absolute, pressure_relative: @event.pressure_relative, rainfall_daily: @event.rainfall_daily, rainfall_hourly: @event.rainfall_hourly, rainfall_monthly: @event.rainfall_monthly, rainfall_weekly: @event.rainfall_weekly, rainfall_yearly: @event.rainfall_yearly, solar_radiation: @event.solar_radiation, solar_uv: @event.solar_uv, solar_uvi: @event.solar_uvi, station_created_at: @event.station_created_at, temperature_in: @event.temperature_in, temperature_out: @event.temperature_out, wind_direction: @event.wind_direction, wind_gust: @event.wind_gust, wind_speed: @event.wind_speed }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { humidity_in: @event.humidity_in, humidity_out: @event.humidity_out, pressure_absolute: @event.pressure_absolute, pressure_relative: @event.pressure_relative, rainfall_daily: @event.rainfall_daily, rainfall_hourly: @event.rainfall_hourly, rainfall_monthly: @event.rainfall_monthly, rainfall_weekly: @event.rainfall_weekly, rainfall_yearly: @event.rainfall_yearly, solar_radiation: @event.solar_radiation, solar_uv: @event.solar_uv, solar_uvi: @event.solar_uvi, station_created_at: @event.station_created_at, temperature_in: @event.temperature_in, temperature_out: @event.temperature_out, wind_direction: @event.wind_direction, wind_gust: @event.wind_gust, wind_speed: @event.wind_speed }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
