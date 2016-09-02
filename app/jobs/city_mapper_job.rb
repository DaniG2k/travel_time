class CityMapperJob < ApplicationJob
  include HTTParty
  queue_as :default

  def perform(route_id)
    begin
      route = Route.find(route_id)

      base_uri = 'https://developer.citymapper.com/api/1/traveltime/'
      startcoord = "startcoord=#{route.startcoords.join('%2C')}"
      endcoord = "endcoord=#{route.endcoords.join('%2C')}"
      key = "key=#{Rails.application.secrets['citymapper_key']}"
      time = "time=#{Time.zone.now.iso8601}"
      str = "#{base_uri}?#{startcoord}&#{endcoord}&time_type=arrival&#{key}&#{time}"
      
      response = JSON.parse(HTTParty.get(str).body)
      
      route.update(travel_time: response['travel_time_minutes'])
    rescue Net::OpenTimeout, Net::ReadTimeout
      {}
    end
  end
end