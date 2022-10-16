require 'rails_helper'

RSpec.describe 'the hotspots show page' do
  before :each do
    @hotspot_1 = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                               rank: 1, accessible: false)
    @hotspot_2 = Hotspot.create!(name: "Sweetwater Wetlands", county: "Pima",
                               rank: 2, accessible: true)                           
  end

  it 'displays the hotspot name' do
    visit "/hotspots/#{@hotspot_1.id}"

    expect(page).to have_content(@hotspot_1.name)
  end

  it 'displays the hotspot attributes' do
    visit "/hotspots/#{@hotspot_1.id}"
    save_and_open_page
    
    expect(page).to have_content(@hotspot_1.county)
    expect(page).to have_content(@hotspot_1.rank)
    expect(page).to have_content(@hotspot_1.accessible)
  end

end