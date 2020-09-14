class RegionsController < ApplicationController
  before_action :require_signed_in!, except: [:index, :show]
  def index
    @regions = Region.all
    @locations = Location.all
  end

  def show
    @region = Region.find(params[:id])
  end
end
