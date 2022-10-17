class HotspotsController < ApplicationController
  def index
    @hotspots = Hotspot.all.order(created_at: :desc)
    # require 'pry'; binding.pry
  end

  def show
    @hotspot = Hotspot.find(params[:id])
  end
end