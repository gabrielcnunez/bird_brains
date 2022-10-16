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

  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)

  it 'displays all of the birds for the hotspot' do
    visit "/hotspots/#{@madera.id}/birds"
    # save_and_open_page

    expect(page).to have_content(@dove.name)
    expect(page).to have_content(@trogon.name)
  end

  it 'displays attributes for each bird' do
    visit "/hotspots/#{@madera.id}/birds"

    expect(page).to have_content(@dove.behavior)
    expect(page).to have_content(@dove.quantity)
    expect(page).to have_content(@dove.raptor)
    expect(page).to have_content(@dove.hotspot_id)
    expect(page).to have_content(@trogon.behavior)
    expect(page).to have_content(@trogon.quantity)
    expect(page).to have_content(@trogon.raptor)
    expect(page).to have_content(@trogon.hotspot_id)
  end
end