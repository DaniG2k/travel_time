module PathsHelper
  def expected_arrival_time(path)
    path.travel_time.minutes.from_now.strftime("%H:%M %P")
  end

  def start_address_value
    Path.count > 0 ? Path.last.end_address : '6-8 Long Lane, London EC1A 9HF'
  end

  def full_itinerary
    if @paths.present?
      content_tag :ul do
        time = @paths.first.departs_at.to_time
        expected = time + @paths.first.travel_time.minutes
        
        @paths.each_with_index do |path, i|
          if i > 0
            concat content_tag(:li, "Wait #{path.visit_duration} minutes...")
            time = expected + path.visit_duration.minutes
            expected = time + path.travel_time.minutes
          end
          
          concat content_tag(:li, "Depart from #{path.start_address} at #{time.strftime("%H:%M %P")} and arrive at #{path.end_address} by #{expected.strftime("%H:%M %P")} (travel time is #{path.travel_time} mins)")
        end
      end.html_safe
    else
      content_tag :ul do
        concat content_tag(:li, "No paths currently present.")
      end.html_safe
    end
  end
end
