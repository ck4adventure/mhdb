class LocationsController < ApplicationController
  before_action :require_signed_in!, except: [:index, :show]
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    
  end

  def create
    location = Location.new(location_params)
    if location.save
      redirect_to locations_path
    else
      flash.now[:errors] = location.errors.full_messages
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
    render :edit
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      flash.now[:errors] = @location.errors.full_messages
      render :edit
    end
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    redirect_to locations_path
  end

  private
  def location_params
    params.require(:location).permit(:name, :rank_id, :region_id)
  end
end
