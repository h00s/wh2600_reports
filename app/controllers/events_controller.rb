class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.where('created_at >= ?', 1.day.ago).order(created_at: :desc)
    data_table_temperature = GoogleVisualr::DataTable.new
    data_table_temperature.new_column('string', 'Vrijeme' )
    data_table_temperature.new_column('number', 'Temperatura °C')

    data_table_pressure = GoogleVisualr::DataTable.new
    data_table_pressure.new_column('string', 'Vrijeme' )
    data_table_pressure.new_column('number', 'Pritisak hPa')

    data_rows_temperature = []
    data_rows_pressure = []
    @events.each do |event|
      data_rows_temperature.push([event.created_at.to_s, event.temperature_out])
      if event.pressure_absolute > 700
        data_rows_pressure.push([event.created_at.to_s, event.pressure_absolute])
      end
    end

    data_table_temperature.add_rows(data_rows_temperature)
    data_table_pressure.add_rows(data_rows_pressure)

    @chart_temperature = GoogleVisualr::Interactive::LineChart.new(data_table_temperature, { title: 'Temperatura' })
    @chart_pressure = GoogleVisualr::Interactive::LineChart.new(data_table_pressure, { title: 'Pritisak' })
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:station_created_at, :temperature_in, :temperature_out, :humidity_in, :humidity_out, :pressure_absolute, :pressure_relative, :wind_direction, :wind_speed, :wind_gust, :solar_radiation, :solar_uv, :solar_uvi, :rainfall_hourly, :rainfall_daily, :rainfall_weekly, :rainfall_monthly, :rainfall_yearly)
    end
end
