class BirdsController < ApplicationController
  def index
    @birds = Bird.all
  end

  def show
    @bird = Bird.find(params[:id])
  end

  def edit
    @bird = Bird.find(params[:id])
  end

  def update
    bird = Bird.find(params[:id])
    bird.update(bird_params)
    
    redirect_to "/birds/#{bird.id}"
  end

  private
  def bird_params
    params.permit(:name, :behavior, :quantity, :raptor?)
  end
  
end