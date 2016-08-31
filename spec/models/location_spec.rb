require 'rails_helper'

RSpec.describe 'Location', type: :model do
  describe 'validations' do
    it 'requires an address' do
      location = Location.new(address: '6-8 Long Ln, London EC1A 9HF')

      expect(location).to be_valid
    end
  end

  describe 'attributes' do
    it 'geocodes the address after saving' do
      location = Location.create(address: '6-8 Long Ln, London EC1A 9HF')
      coords = [location.longitude, location.latitude]

      expect(coords).to eq [51.5199519, -0.0984235]
    end
  end
end