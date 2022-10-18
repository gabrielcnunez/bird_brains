require 'rails_helper'

RSpec.describe 'the hotspots index page' do
  before :each do
    @hotspot_1 = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                               rank: 1, accessible: false)
    @hotspot_2 = Hotspot.create!(name: "Sweetwater Wetlands", county: "Pima",
                               rank: 2, accessible: true)                           
  end

  it 'displays the hotspots page' do
    visit "/hotspots"
    
    expect(page).to have_content(@hotspot_1.name)
    expect(page).to have_content(@hotspot_2.name)
  end

  it 'displays hotspots in order created' do
    visit "/hotspots"

    expect("Sweetwater Wetlands").to appear_before("Madera Canyon", only_text: true)
  end

  it 'displays creation timestamp next to hotspot' do
    visit "/hotspots"

    expect(page).to have_content(@hotspot_1.created_at)
    expect(page).to have_content(@hotspot_2.created_at)
  end

  it 'has a link to the birds index' do
    visit "/hotspots"
    click_on "Birds"

    expect(current_path).to eq("/birds")
  end

  it 'has a link to the hotspots index' do
    visit "/hotspots"
    click_on "Hotspots"

    expect(current_path).to eq("/hotspots")
  end

  it 'has a link to edit each hotspot' do
    visit "/hotspots"
    
    expect(page).to have_content("Edit #{@hotspot_1.name}")
    expect(page).to have_content("Edit #{@hotspot_2.name}")
  end

  it 'has a link that redirects to each hotspots edit page' do
    visit "/hotspots"

    click_on "Edit #{@hotspot_1.name}"

    expect(current_path).to eq("/hotspots/#{@hotspot_1.id}/edit")

    visit "/hotspots"

    click_on "Edit #{@hotspot_2.name}"

    expect(current_path).to eq("/hotspots/#{@hotspot_2.id}/edit")
  end
  
end