class Api::RanksController < ApplicationController
  def index
    @ranks = Rank.all
    render 'api/ranks/index'
  end
end
