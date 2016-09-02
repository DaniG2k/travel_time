module RoutesHelper
  def expected_arrival_time
    @route.travel_time.minutes.from_now.strftime("%H:%M %P")
  end
end