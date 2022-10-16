require 'rails_helper'

RSpec.describe Bird do
  it {should belong_to :hotspot}
  
end