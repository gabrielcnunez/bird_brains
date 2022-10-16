require 'rails_helper'

RSpec.describe 'the birds index page' do
  before :each do
    @hotspot_1 = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                               rank: 1, accessible: false)
    @hotspot_2 = Hotspot.create!(name: "Sweetwater Wetlands", county: "Pima",
                               rank: 2, accessible: true)
    @bird_1 = Bird.create!(name: "Mourning Dove", behavior: "feeding",
                          quantity: 3, raptor: false, hotspot_id: @hotspot_1.id)
    @bird_2 = Bird.create!(name: "Cooper's Hawk", behavior: "soaring",
                          quantity: 1, raptor: true, hotspot_id: @hotspot_2.id)
  end

  it 'displays the birds page' do
    visit "/birds"
    
    expect(page).to have_content(@bird_1.name)
    expect(page).to have_content(@bird_2.name)
  end

  it 'displays the birds attributes' do
    visit "/birds"
    
    expect(page).to have_content(@bird_1.behavior, @bird_1.quantity, @bird_1.raptor, @bird_1.hotspot_id)
    expect(page).to have_content(@bird_2.behavior, @bird_2.quantity, @bird_2.raptor, @bird_2.hotspot_id)
  end
  
end