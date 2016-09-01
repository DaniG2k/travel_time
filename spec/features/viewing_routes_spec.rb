require 'rails_helper'

RSpec.feature 'Users can view travel times' do
  scenario 'by setting routes' do
    visit '/'
    fill_in 'Start address', with: '6-8 Long Lane, London EC1A 9HF'
    fill_in 'End address', with: 'Euston Rd, London N1 9AL'
    click_button 'Calculate!'

    expect(page).to have_content 'minutes'
  end
end