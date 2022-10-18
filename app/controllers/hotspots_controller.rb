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

  def edit
    @hotspot = Hotspot.find(params[:id])
  end

  def update
    hotspot = Hotspot.find(params[:id])
    hotspot.update(hotspot_params)
    
    redirect_to "/hotspots/#{hotspot.id}"
  end

  private
  def hotspot_params
    params.permit(:name, :county, :rank, :accessible)
  end 
end