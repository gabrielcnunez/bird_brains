require 'rails_helper'

RSpec.describe 'the birds show page' do
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

  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes
  # (data from each column that is on the child table)

  it 'displays the bird name' do
    visit "/birds/#{@bird_1.id}"
    # save_and_open_page

    expect(page).to have_content(@bird_1.name)
  end

  it 'displays the bird attributes' do
    visit "/birds/#{@bird_1.id}"
    
    expect(page).to have_content(@bird_1.behavior)
    expect(page).to have_content(@bird_1.quantity)
    expect(page).to have_content(@bird_1.raptor)
    expect(page).to have_content(@bird_1.hotspot_id)
  end

end