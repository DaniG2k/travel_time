module RoutesHelper
  def expected_arrival_time(route)
    route.travel_time.minutes.from_now.strftime("%H:%M %P")
  end

  def full_itinerary
    content_tag :ul do
      first_route = @routes.first
      time = first_route.departs_at.to_time
      content_tag :li, "Depart at #{time.strftime("%H:%M %P")} and arrive by #{first_route.travel_time.minutes.from_now.strftime("%H:%M %P")}"
      
      @routes[1..-1].each do |route|
        time += 30.minutes
        content_tag :li, "Wait 30 minutes..."
        expected = time + route.travel_time.minutes
        content_tag :li, "Depart at #{time.strftime("%H:%M %P")} and arrive by #{expected.strftime("%H:%M %P")}"
      end
    end
    
  end
end