require 'rails_helper'

RSpec.feature 'Users can view all paths from the index' do
  let!(:path) { FactoryGirl.create(:path) }

  scenario 'successfully' do
    visit '/'
    click_link 'All paths'

    expect(page).to have_content('Depart from 6-8 Long Lane, London EC1A 9HF at')
    expect(page).to have_content('arrive at Euston Rd, London N1 9AL by')
  end
end
