require 'rails_helper'

RSpec.describe 'edit a Hotspot' do
  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information
  it 'has a link to the edit page from the Birds show page' do
    hotspot = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                              rank: 1, accessible: false)
    bird = hotspot.birds.create!(name: "Mourning Dove", behavior: "feeding",
                                  quantity: 3, raptor: false)
    visit "/birds/#{bird.id}"
    
    click_button "Edit #{bird.name}"

    expect(current_path).to eq("/birds/#{bird.id}/edit")
  end

  it 'can edit the Hotspot' do
    hotspot = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                              rank: 1, accessible: false)
    bird = hotspot.birds.create!(name: "Mourning Dove", behavior: "feeding",
                                  quantity: 3, raptor: false)
    visit "/birds/#{bird.id}"

    click_button "Edit #{bird.name}"

    fill_in 'Name', with: 'Mourning Dove'
    click_button 'Update Bird'

    expect(current_path).to eq("/birds/#{bird.id}")
    expect(page).to have_content("Mourning Dove")
  end
end