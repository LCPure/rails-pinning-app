class PinsController < ApplicationController
  
  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
	render :show
  end
  
  def index
    @pins = Pin.all
  end
  
  def show
    @pin = Pin.find(params[:id])
  end
  
end