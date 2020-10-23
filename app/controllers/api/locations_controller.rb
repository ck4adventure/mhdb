class Api::LocationsController < ApplicationController
  def index
    @locations = Location.all
    render 'api/locations/index'
  end

  def show
    @location = Location.find(params[:id])
    render 'api/locations/show'
  end

  def create
    # image save happens here automatically through activerecord!
    @location = Location.new(location_params)
    if @location.save
      render 'api/locations/show'
    else
      render json: ["Unable to save location"], status: 400
    end
  end

  def update
    # auto handling of images, frontend only sending data if it gets a new image 
    # todo:  better typechecking, and error handling
    @location = Location.find(params[:id])
    if @location.update!(location_params)
      render 'api/locations/show'
    else
      render json: ["Unable to update location"], status: 400
    end
  end

  private 
  def location_params
    params.require(:location).permit(:name, :region_id, :rank_id, :image)
  end

end
