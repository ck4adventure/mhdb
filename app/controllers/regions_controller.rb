class RegionsController < ApplicationController
  def index
    @regions = Region.all
    @locations = Location.all
  end

  def show
    @region = Region.find(params[:id])
  end
end
