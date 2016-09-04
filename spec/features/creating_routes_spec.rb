require 'rails_helper'

RSpec.feature 'Users can create new routes' do
  let!(:route) { FactoryGirl.create(:route) }

  scenario 'where the end_address of dest1 becomes the start_address of dest2' do
    visit '/routes/new'

    expect(page).to have_selector("input[value='Euston Rd, London N1 9AL']")
  end
end