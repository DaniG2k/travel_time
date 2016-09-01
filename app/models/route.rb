class Route < ApplicationRecord
  validates_presence_of :startcoords, :endcoords
  serialize :startcoords, Array
  serialize :endcoords, Array

  def set_travel_time!
    CityMapperJob.perform_later(id)
  end
end
