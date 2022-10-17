class HotspotsController < ApplicationController
  def index
    hotspots = Hotspot.all
    @hotspots = hotspots.newest_first
  end

  def show
    @hotspot = Hotspot.find(params[:id])
  end
end