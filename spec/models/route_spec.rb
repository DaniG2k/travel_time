require 'rails_helper'

RSpec.describe Route, type: :model do
  describe 'validations' do
    it 'requires a start and end location' do
      location1 = Location.create address: '6-8 Long Ln, London EC1A 9HF'
      location2 = Location.create address: 'Euston Rd, London N1 9AL'
      route = Route.new(start: location1.coordinates, end: location2.coordinates)

      expect(route).to be_valid
    end
  end
end