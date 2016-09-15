class CityMapperJob < ApplicationJob
  include HTTParty
  queue_as :default

  def perform(path_id)
    begin
      path = Path.find(path_id)

      base_uri = 'https://developer.citymapper.com/api/1/traveltime/'
      startcoord = "startcoord=#{path.startcoords.join('%2C')}"
      endcoord = "endcoord=#{path.endcoords.join('%2C')}"
      key = "key=#{Rails.application.secrets['citymapper_key']}"
      time = "time=#{Time.zone.now.iso8601}"
      str = "#{base_uri}?#{startcoord}&#{endcoord}&time_type=arrival&#{key}&#{time}"
      
      response = JSON.parse(HTTParty.get(str).body)
      
      path.update(travel_time: response['travel_time_minutes'])
    rescue Net::OpenTimeout, Net::ReadTimeout
      # Perform some fancy logging here.
      {}
    end
  end
end
