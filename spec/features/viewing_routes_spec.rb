require 'rails_helper'

RSpec.feature 'Users can view travel times' do
  scenario 'successfully' do
    visit '/'
    fill_in 'Start address', with: '6-8 Long Lane, London EC1A 9HF'
    fill_in 'End address', with: 'Euston Rd, London N1 9AL'
    select '30 mins', from: 'route_visit_duration'
    click_button 'Calculate!'

    expect(page).to have_content 'Route was successfully retrieved!'
  end

  scenario 'unsuccessfully' do
    visit '/'
    fill_in 'Start address', with: '6-8 Long Lane, London EC1A 9HF'
    click_button 'Calculate!'

    expect(page).to have_content 'Bzzz....Brrr....There was a problem when submitting the form!'
  end

  # it 'form throws an error when location is out of London' do
  #   fill_in 'End address', with: 'Dublin, Ireland'
  #   click_button 'Calculate!'

  #   expect(page).to have_content 'The specified route is beyond the bounds of London.'
  # end

  scenario 'with arrival time estimate' do
    visit '/'
    fill_in 'Start address', with: '6-8 Long Lane, London EC1A 9HF'
    fill_in 'End address', with: 'Victoria St, London SW1E 5ND'
    select '45 mins', from: 'route_visit_duration'
    click_button 'Calculate!'

    expect(page).to have_content 'If you leave now, your expected arrival time is'
  end
end