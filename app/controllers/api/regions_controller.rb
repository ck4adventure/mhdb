class Api::RegionsController < ApplicationController
  def index
    @regions = Region.all
    render 'api/regions/index', status: 200
  end
end
