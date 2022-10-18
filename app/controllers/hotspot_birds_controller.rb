class HotspotBirdsController < ApplicationController
  def index
    @hotspot = Hotspot.find(params[:hotspot_id])
    @birds = @hotspot.birds
  end

  def new
    @hotspot = Hotspot.find(params[:hotspot_id])
  end

  def create
    hotspot = Hotspot.find(params[:hotspot_id])
    bird = hotspot.birds.create(bird_params)
    
    redirect_to "/hotspots/#{hotspot.id}/birds"
  end

  private
  def bird_params
    params.permit(:name, :behavior, :quantity, :raptor)
  end

end