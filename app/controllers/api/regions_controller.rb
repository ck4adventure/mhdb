class Api::RegionsController < ApplicationController
  def index
    @regions = Region.all
    render 'api/regions/index'
  end
end
