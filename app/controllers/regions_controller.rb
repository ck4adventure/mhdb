class RegionsController < ApplicationController
  def index
    @regions = Region.all
    @locations = Location.all
  end
end
