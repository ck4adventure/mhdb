class Api::LocationsController < ApplicationController
  def index
    @locations = Location.all
    render 'api/locations/index'
  end

  def create
    @location = Location.new(name: params[:location][:name], region_id: params[:location][:regionId], rank_id: params[:location][:rankId])
    if @location.save
      render 'api/locations/show'
    else
      render json: ["Unable to save location"], status: 400
    end
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    render json: { message: "Location #{location.name} successfully deleted" }, status: 200
  end


end
