require 'rails_helper'

RSpec.describe 'Location', type: :model do

  describe 'validations' do
    it 'requires an address' do
      location = Location.new(address: '6-8 Long Ln, London EC1A 9HF')

      expect(location).to be_valid
    end
  end

  describe 'attributes' do
    it '#coordinates returns longitude and latitude' do
      location = Location.create(address: '6-8 Long Ln, London EC1A 9HF')

      expect(location.coordinates).to eq [-0.0984235, 51.5199519]
    end
  end
end