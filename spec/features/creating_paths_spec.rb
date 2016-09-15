require 'rails_helper'

RSpec.feature 'Users can create new paths' do
  let!(:path) { FactoryGirl.create(:path) }

  scenario 'where the end_address of dest1 becomes the start_address of dest2' do
    visit '/paths/new'

    expect(page).to have_selector("input[value='Euston Rd, London N1 9AL']")
  end
end
