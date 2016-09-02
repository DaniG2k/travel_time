require 'rails_helper'

RSpec.feature 'Users can view all routes from the index' do
  scenario 'successfully' do
    visit '/'
    click_link 'All routes'

    expect(page).to have_content('Depart at')
    expect(page).to have_content('Arrive by')
  end
end