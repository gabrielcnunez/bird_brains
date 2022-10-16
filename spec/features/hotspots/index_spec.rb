require 'rails_helper'

RSpec.describe 'the hotspots index page' do
  before :each do
    @hotspot = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                               rank: 1, accessible: false)
  end

  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'displays the hotspots page' do
    visit "/hotspots"

    expect(page).to have_content(@hotspot.name)
  end
  
end