require 'rails_helper'

RSpec.describe 'edit a Hotspot' do
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