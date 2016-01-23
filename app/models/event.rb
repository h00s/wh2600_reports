class Event < ActiveRecord::Base
  validates :temperature_in, numericality: { greater_than_or_equal_to: -40, less_than_or_equal_to: 60 }
  validates :temperature_out, numericality: { greater_than_or_equal_to: -40, less_than_or_equal_to: 60 }
  validates :humidity_in, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :humidity_out, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :pressure_absolute, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 1000 }
  validates :pressure_relative, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 1000 }
  validates :wind_direction, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 360 }
end
