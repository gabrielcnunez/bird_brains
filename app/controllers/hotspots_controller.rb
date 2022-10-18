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
    hotspot = Hotspot.create(hotspot_params)
    redirect_to "/hotspots"
  end

  private
  def hotspot_params
    params.permit(:name, :county, :rank, :accessible)
  end 
end