require 'rails_helper'

RSpec.describe Path, type: :model do
  describe 'validations' do
    it 'requires a start, end addresses, depart time and visit duration' do
      l1 = '6-8 Long Ln, London EC1A 9HF' 
      l2 = 'Euston Rd, London N1 9AL'
      path = Path.new(
        start_address: l1,
        end_address: l2,
        departs_at: Time.zone.now,
        visit_duration: 30)

      expect(path).to be_valid
    end
  end

  describe 'attributes' do
    it 'receives longitude and latitude coordiantes upon creation' do
      l1 = '6-8 Long Ln, London EC1A 9HF' 
      l2 = 'Euston Rd, London N1 9AL'
      path = Path.create(
        start_address: l1,
        end_address: l2,
        departs_at: Time.zone.now,
        visit_duration: 30)

      expect(path.start_lat).to be_present
      expect(path.start_lon).to be_present
      expect(path.end_lat).to be_present
      expect(path.end_lon).to be_present
    end
  end
end
