require 'rails_helper'

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe 'creating a new Hotspot Bird' do
  before :each do
    @madera = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                              rank: 1, accessible: false)
    @dove = @madera.birds.create!(name: "Mourning Dove", behavior: "feeding",
                                  quantity: 3, raptor: false)
    @trogon = @madera.birds.create!(name: "Elegant Trogon", behavior: "calling",
                                    quantity: 1, raptor: false)                                                   
  end

  it 'has a link to the new Bird page from the Hotspot Birds index page' do
    visit "/hotspots/#{@madera.id}/birds"

    click_link('Add New Bird to Hotspot')

    expect(current_path).to eq("/hotspots/#{@madera.id}/birds/new")
  end

  it 'can create a new Hotspot Bird' do
    visit "/hotspots/#{@madera.id}/birds"

    click_link('Add New Bird to Hotspot')

    fill_in('Name', with: 'Turkey Vulture')
    fill_in('Behavior', with: 'soaring')
    fill_in('Quantity', with: '7')
    fill_in('Raptor?', with: 'true')
    click_button('Add Bird to Hotspot')

    expect(current_path).to eq("/hotspots/#{@madera.id}/birds")
    expect(page).to have_content('Turkey Vulture')
    expect(page).to have_content('soaring')
    expect(page).to have_content('7')
    expect(page).to have_content('true')
  end

end