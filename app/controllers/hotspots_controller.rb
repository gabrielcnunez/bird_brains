class HotspotsController < ApplicationController
  def index
    @hotspots = Hotspot.all
    # require 'pry'; binding.pry
  end

  def show
    # require 'pry'; binding.pry
    @hotspot = Hotspot.find(params[:id])
  end
end