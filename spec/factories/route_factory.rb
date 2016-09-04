FactoryGirl.define do
  factory :route do
    start_address '6-8 Long Lane, London EC1A 9HF'
    end_address 'Euston Rd, London N1 9AL'
    visit_duration 30
    travel_time 25.0
    departs_at 20.minutes.from_now
    start_lat 51.519952
    start_lon -0.098423
    end_lat 51.530656
    end_lon -0.122543
  end
end