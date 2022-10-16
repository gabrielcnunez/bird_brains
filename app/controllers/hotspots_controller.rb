class HotspotsController < ApplicationController
  def index
    @hotspots = Hotspot.all
  end

  def show
    @hotspot = Hotspot.find(params[:id])
  end
end