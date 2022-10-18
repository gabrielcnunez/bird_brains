require 'rails_helper'

RSpec.describe 'creating a new Hotspot' do
  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
  
  it 'has a link to the new page from the Hotspot index page' do
    visit "/hotspots"

    click_link('New Hotspot')

    expect(current_path).to eq('/hotspots/new')
  end

  it 'can create a new Hotpost' do
    visit '/hotspots/new'

    fill_in('Name', with: 'Turkey Creek Trail')
    click_button('Create Hotspot')

    expect(current_path).to eq('/hotspots')
    expect(page).to have_content('Turkey Creek Trail')
  end
end
