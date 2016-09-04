module RoutesHelper
  def expected_arrival_time(route)
    route.travel_time.minutes.from_now.strftime("%H:%M %P")
  end

  def full_itinerary
    if @routes.present?
      content_tag :ul do
        time = @routes.first.departs_at.to_time
        expected = time + @routes.first.travel_time.minutes
        
        @routes.each_with_index do |route, i|
          if i > 0
            concat content_tag(:li, "Wait 30 minutes...")
            time = expected + 30.minutes
            expected = time + route.travel_time.minutes
          end
          
          concat content_tag(:li, "Depart from #{route.start_address} at #{time.strftime("%H:%M %P")} and arrive at #{route.end_address} by #{expected.strftime("%H:%M %P")} (travel time is #{route.travel_time} mins)")
        end
      end.html_safe
    else
      content_tag :ul do
        concat content_tag(:li, "No routes currently present.")
      end.html_safe
    end
  end
end