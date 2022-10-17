class HotspotsController < ApplicationController
  def index
    @hotspots = Hotspot.all.order(created_at: :desc)
  end

  def show
    @hotspot = Hotspot.find(params[:id])
  end
end