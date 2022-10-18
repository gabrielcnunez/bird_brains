class HotspotsController < ApplicationController
  def index
    hotspots = Hotspot.all
    @hotspots = hotspots.newest_first
  end

  def show
    @hotspot = Hotspot.find(params[:id])
  end

  def new
  end

  def create
    hotspot = Hotspot.create(name: params[:name],
                             county: params[:county],
                             rank: params[:rank],
                             accessible: params[:accessible])
    redirect_to "/hotspots"
  end
end