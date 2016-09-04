class Route < ApplicationRecord
  include HTTParty
  validates_presence_of :start_address, :end_address, :departs_at, :visit_duration
  #validate :route_within_london
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

  # TODO
  # Limit to London addresses
  # def route_within_london
  #   distance = 20
  #   center_point = [51.568449, -0.071068]
  #   box = Geocoder::Calculations.bounding_box(center_point, distance)
  #   msg = "cannot be outside of London"
  #   if !end_address.within_bounding_box(box)
  #     errors.add(:end_address, msg)
  #   elsif !start_address.within_bounding_box(box)
  #     errors.add(:start_address, msg)
  #   end
  # end
end
