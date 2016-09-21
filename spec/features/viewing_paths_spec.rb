require 'rails_helper'

RSpec.feature 'Users can view paths' do
  # scenario 'successfully' do
  #   visit '/'
  #   fill_in 'Start address', with: '6-8 Long Lane, London EC1A 9HF'
  #   fill_in 'End address', with: 'Euston Rd, London N1 9AL'
  #   select '30 mins', from: 'path_visit_duration'
  #   click_button 'Calculate!'

  #   expect(page).to have_content 'Path was successfully retrieved!'
  # end

  # scenario 'unsuccessfully' do
  #   visit '/'
  #   fill_in 'Start address', with: '6-8 Long Lane, London EC1A 9HF'
  #   click_button 'Calculate!'

  #   expect(page).to have_content 'Bzzz....Brrr....There was a problem when submitting the form!'
  # end

  # # it 'form throws an error when location is out of London' do
  # #   fill_in 'End address', with: 'Dublin, Ireland'
  # #   click_button 'Calculate!'

  # #   expect(page).to have_content 'The specified path is beyond the bounds of London.'
  # # end

  # scenario 'with arrival time estimate' do
  #   visit '/'
  #   fill_in 'Start address', with: '6-8 Long Lane, London EC1A 9HF'
  #   fill_in 'End address', with: 'Victoria St, London SW1E 5ND'
  #   select '45 mins', from: 'path_visit_duration'
  #   click_button 'Calculate!'

  #   expect(page).to have_content 'If you leave now, your expected arrival time is'
  # end

  let!(:path) { FactoryGirl.create(:path) }
  scenario 'displays nearby points' do
    allow_any_instance_of(Path).to receive(:get_nearby_points).and_return({"properties": [{"uid":"9363","identifier":6847,"bed":2,"property_type_name":"Flat","lat":51.425603,"lng":-0.085485,"rent":1410.0,"pic":"https://i.embed.ly/1/display/crop?height=300&key=63af78e9d8b94864af165d41eb2760f6&url=https%3A%2F%2Frentify-com.s3.amazonaws.com%2Fuploads%2Fproduction%2Fphoto%2Fimage%2F1473679501-15251-0181%2FSE19_1QN-3.jpg&width=553","area":"SE19","path":"/rental-properties-in-london/stylish-2-bedroom-apartment-in-se19","address":"Charters Close, London","advert_state":"published","published_at":"2016-09-21T19:02:18.347+01:00","completed_at":"2016-09-21T15:45:30.513+01:00","source":"rentify","outcode":"SE","slug":"stylish-2-bedroom-apartment-in-se19","updated_at":"2016-09-21T19:02:18.364+01:00","vip":true,"under_offer":false}]})

    visit "/paths/#{path.id}"

    expect(page).to have_content 'Nearby points:'
    expect(page).to have_content '9363'
  end
end
