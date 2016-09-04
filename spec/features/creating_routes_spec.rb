require 'rails_helper'

RSpec.feature 'Users can create new routes' do
  let!(:route) { FactoryGirl.create(:route) }

  scenario 'where the end address of dest1 becomes the start address of dest2' do
    visit '/routes/new'

    within(:css, "input#route_start_address") do
      expect(page).to have_content('Euston Rd, London N1 9AL')
    end
  end
end