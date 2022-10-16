class HotspotsController < ApplicationController
  def index
    @hotspots = Hotspot.all
    # require 'pry'; binding.pry
  end
end