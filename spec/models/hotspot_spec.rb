require 'rails_helper'

RSpec.describe Hotspot do
  it {should have_many :birds}

  before :each do
    @madera = Hotspot.create!(name: "Madera Canyon", county: "Santa Cruz",
                              rank: 1, accessible: false)
    @sweet = Hotspot.create!(name: "Sweetwater Wetlands", county: "Pima",
                                 rank: 2, accessible: true)
    @dove = @madera.birds.create!(name: "Mourning Dove", behavior: "feeding",
                                  quantity: 3, raptor: false)
    @trogon = @madera.birds.create!(name: "Elegant Trogon", behavior: "calling",
                                    quantity: 1, raptor: false)
    @cooper = @sweet.birds.create!(name: "Cooper's Hawk", behavior: "soaring",
                                        quantity: 1, raptor: true)                         
  end

  describe 'class methods' do
    describe '#newest_first' do
      it 'returns hotspots by most recently created first' do
        expect(Hotspot.newest_first).to eq([@sweet, @madera])
      end
    end
  end

  describe 'instance methods' do
    describe '#bird_count' do
      it 'counts the number of birds associated with a hotspot' do
        expect(@madera.bird_count).to eq(2)
        expect(@sweet.bird_count).to eq(1)
      end
    end
  end
  
end