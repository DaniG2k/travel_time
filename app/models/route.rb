class Route < ApplicationRecord
  include HTTParty

  validates_presence_of :startcoords, :endcoords
  serialize :startcoords, Array
  serialize :endcoords, Array

  def get_travel_time!
    base_uri = 'https://developer.citymapper.com/api/1/traveltime/'
    startcoord = "startcoord=#{startcoords.join('%2C')}"
    endcoord = "endcoord=#{endcoords.join('%2C')}"
    key = "key=#{Rails.application.secrets['citymapper_key']}"
    time = "time=#{Time.zone.now.iso8601}"
    str = "#{base_uri}?#{startcoord}&#{endcoord}&time_type=arrival&#{key}&#{time}"
    
    response = HTTParty.get(str)
  end
end
