class HotspotBirdsController < ApplicationController
  def index
    @hotspot = Hotspot.find(params[:hotspot_id])
    @birds = @hotspot.birds
    # require 'pry'; binding.pry
  end
end