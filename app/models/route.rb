class Route < ApplicationRecord
  include HTTParty
  validates_presence_of :start_address, :end_address, :departs_at
  before_save :geocode_start_address
  before_save :geocode_end_address

  def set_travel_time!
    # Uncomment the following to enable Sidekiq job
    # CityMapperJob.perform_later(id)
    #
    begin
      base_uri = 'https://developer.citymapper.com/api/1/traveltime/'
      startcoord = "startcoord=#{[start_lat, start_lon].join('%2C')}"
      endcoord = "endcoord=#{[end_lat, end_lon].join('%2C')}"
      key = "key=#{Rails.application.secrets['citymapper_key']}"
      time = "time=#{departs_at}"
      str = "#{base_uri}?#{startcoord}&#{endcoord}&time_type=arrival&#{key}&#{time}"
      response = JSON.parse(HTTParty.get(str).body)
      update(travel_time: response['travel_time_minutes'])
    rescue Net::OpenTimeout, Net::ReadTimeout
      # Do some fancy logging
      {}
    end
  end

  def geocode_start_address
    coordinates = Geocoder.coordinates start_address
    self.start_lat = coordinates[0]
    self.start_lon = coordinates[1]
  end

  def geocode_end_address
    coordinates = Geocoder.coordinates end_address
    self.end_lat = coordinates[0]
    self.end_lon = coordinates[1]
  end
end
