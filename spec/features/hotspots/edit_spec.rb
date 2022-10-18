require 'rails_helper'

RSpec.describe 'edit a Hotspot' do
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to update the parent "Update Parent"
  # When I click the link "Update Parent"
  # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info
  it 'has a link to the edit page from the Hotspot show page' do
    hotspot = Hotspot.create!(name: 'Turkey Creek Canyon',
                              county: 'Cochise',
                              rank: 3,
                              accessible: true)
    
    visit "/hotspots/#{hotspot.id}"
    click_button "Edit #{hotspot.name}"

    expect(current_path).to eq("/hotspots/#{hotspot.id}/edit")
  end

  it 'can edit the Hotspot' do
    hotspot = Hotspot.create!(name: 'Turkey Crick Canyon',
                              county: 'Cochise',
                              rank: 3,
                              accessible: true)

    visit "/hotspots/#{hotspot.id}"
    click_button "Edit #{hotspot.name}"

    fill_in 'Name', with: 'Turkey Creek Canyon'
    click_button 'Update Hotspot'
    
    expect(current_path).to eq("/hotspots/#{hotspot.id}")
    expect(page).to have_content('Turkey Creek Canyon')
  end
end