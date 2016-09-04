require 'rails_helper'

RSpec.describe Route, type: :model do
  describe 'validations' do
    it 'requires a start, end addresses, depart time and visit duration' do
      l1 = '6-8 Long Ln, London EC1A 9HF' 
      l2 = 'Euston Rd, London N1 9AL'
      route = Route.new(
        start_address: l1,
        end_address: l2,
        departs_at: Time.zone.now,
        visit_duration: 30)

      expect(route).to be_valid
    end
  end

  describe 'attributes' do
    it 'receives longitude and latitude coordiantes upon creation' do
      l1 = '6-8 Long Ln, London EC1A 9HF' 
      l2 = 'Euston Rd, London N1 9AL'
      route = Route.create(
        start_address: l1,
        end_address: l2,
        departs_at: Time.zone.now,
        visit_duration: 30)

      expect(route.start_lat).to be_present
      expect(route.start_lon).to be_present
      expect(route.end_lat).to be_present
      expect(route.end_lon).to be_present
    end
  end
end