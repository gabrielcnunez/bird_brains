require 'rails_helper'

RSpec.describe 'the hotspots birds index page' do
  before :each do
    @madera = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                              rank: 1, accessible: false)
    @dove = @madera.birds.create!(name: "Mourning Dove", behavior: "feeding",
                                  quantity: 3, raptor: false)
    @trogon = @madera.birds.create!(name: "Elegant Trogon", behavior: "calling",
                                    quantity: 1, raptor: false)                                                   
  end

  it 'displays all of the birds for the hotspot' do
    visit "/hotspots/#{@madera.id}/birds"

    expect(page).to have_content(@dove.name)
    expect(page).to have_content(@trogon.name)
  end

  it 'displays attributes for each bird' do
    visit "/hotspots/#{@madera.id}/birds"

    expect(page).to have_content(@dove.behavior)
    expect(page).to have_content(@dove.quantity)
    expect(page).to have_content(@dove.raptor)
    expect(page).to have_content(@trogon.behavior)
    expect(page).to have_content(@trogon.quantity)
    expect(page).to have_content(@trogon.raptor)
  end

  it 'has a link to the birds index' do
    visit "/hotspots/#{@madera.id}/birds"
    click_on "Birds"

    expect(current_path).to eq("/birds")
  end

  it 'has a link to the hotspots index' do
    visit "/hotspots/#{@madera.id}/birds"
    click_on "Hotspots"

    expect(current_path).to eq("/hotspots")
  end

  it 'has a link to sort birds alphabetically' do
    visit "/hotspots/#{@madera.id}/birds"
    click_on "Sort Birds by Name"

    expect(current_path).to eq("/hotspots/#{@madera.id}/birds")
  end

  it 'can sort birds alphabetically by name' do
    visit "/hotspots/#{@madera.id}/birds"

    expect("Mourning Dove").to appear_before("Elegant Trogon", only_text: true)
    
    click_on "Sort Birds by Name"

    expect("Elegant Trogon").to appear_before("Mourning Dove", only_text: true)
  end

end