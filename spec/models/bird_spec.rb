require 'rails_helper'

RSpec.describe Bird do
  it {should belong_to :hotspot}

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
    describe '#show_raptor' do
      it 'returns birds where raptor? boolean is true' do
        expect(Bird.show_raptor_is_true).to eq([@cooper])
      end
    end
  end
  
end