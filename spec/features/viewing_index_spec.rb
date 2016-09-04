require 'rails_helper'

RSpec.feature 'Users can view all routes from the index' do
  let!(:route) { FactoryGirl.create(:route) }

  scenario 'successfully' do
    visit '/'
    click_link 'All routes'

    expect(page).to have_content('Depart from 6-8 Long Lane, London EC1A 9HF at')
    expect(page).to have_content('arrive at Euston Rd, London N1 9AL by')
  end
end