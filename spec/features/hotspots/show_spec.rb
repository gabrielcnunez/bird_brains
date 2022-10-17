require 'rails_helper'

RSpec.describe 'the hotspots show page' do
  before :each do
    @madera = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                              rank: 1, accessible: false)
    @dove = @madera.birds.create!(name: "Mourning Dove", behavior: "feeding",
                                  quantity: 3, raptor: false)
    @trogon = @madera.birds.create!(name: "Elegant Trogon", behavior: "calling",
                                    quantity: 1, raptor: false)                               
  end

  it 'displays the hotspot name' do
    visit "/hotspots/#{@madera.id}"

    expect(page).to have_content(@madera.name)
  end

  it 'displays the hotspot attributes' do
    visit "/hotspots/#{@madera.id}"
    
    expect(page).to have_content(@madera.county)
    expect(page).to have_content(@madera.rank)
    expect(page).to have_content(@madera.accessible)
  end

end