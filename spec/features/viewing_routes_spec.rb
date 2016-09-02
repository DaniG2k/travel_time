require 'rails_helper'

RSpec.feature 'Users can view travel times' do
  scenario 'successfully' do
    visit '/'
    fill_in 'Start address', with: '6-8 Long Lane, London EC1A 9HF'
    fill_in 'End address', with: 'Euston Rd, London N1 9AL'
    click_button 'Calculate!'

    expect(page).to have_content 'Route was successfully retrieved!'
  end

  scenario 'unsuccessfully' do
    visit '/'
    fill_in 'Start address', with: '6-8 Long Lane, London EC1A 9HF'
    click_button 'Calculate!'

    expect(page).to have_content 'Bzzz....Brrr....There was a problem!'
  end

  scenario 'with arrival time estimate' do
    visit '/'
    fill_in 'Start address', with: '6-8 Long Lane, London EC1A 9HF'
    fill_in 'End address', with: 'Victoria St, London SW1E 5ND'
    click_button 'Calculate!'

    expect(page).to have_content 'Your expected arrival time is'
  end
end