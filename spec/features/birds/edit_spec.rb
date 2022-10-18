require 'rails_helper'

RSpec.describe 'edit a Hotspot' do
  it 'has a link to the edit page from the Birds show page' do
    hotspot = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                              rank: 1, accessible: false)
    bird = hotspot.birds.create!(name: "Mourning Dove", behavior: "feeding",
                                  quantity: 3, raptor: false)
    visit "/birds/#{bird.id}"
    
    click_link "Edit #{bird.name}"

    expect(current_path).to eq("/birds/#{bird.id}/edit")
  end

  it 'can edit the Bird' do
    hotspot = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                              rank: 1, accessible: false)
    bird = hotspot.birds.create!(name: "Morning Dove", behavior: "feeding",
                                  quantity: 3, raptor: false)
    visit "/birds/#{bird.id}"

    click_link "Edit #{bird.name}"

    fill_in 'Name', with: 'Mourning Dove'
    click_button 'Update Bird'

    expect(current_path).to eq("/birds/#{bird.id}")
    expect(page).to have_content("Mourning Dove")
  end
end