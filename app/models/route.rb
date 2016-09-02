class Route < ApplicationRecord
  include HTTParty
  validates_presence_of :startcoords, :endcoords
  serialize :startcoords, Array
  serialize :endcoords, Array

  def set_travel_time!
    # Uncomment the following to enable Sidekiq job
    # CityMapperJob.perform_later(id)
    #
    begin
      base_uri = 'https://developer.citymapper.com/api/1/traveltime/'
      startcoord = "startcoord=#{startcoords.join('%2C')}"
      endcoord = "endcoord=#{endcoords.join('%2C')}"
      key = "key=#{Rails.application.secrets['citymapper_key']}"
      time = "time=#{departs_at}"
      str = "#{base_uri}?#{startcoord}&#{endcoord}&time_type=arrival&#{key}&#{time}"
      
      response = JSON.parse(HTTParty.get(str).body)
      
      self.update(travel_time: response['travel_time_minutes'])

    rescue Net::OpenTimeout, Net::ReadTimeout
      {}
    end
  end
end
