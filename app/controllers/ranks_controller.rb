class RanksController < ApplicationController
  def show
    @rank = Rank.find(params[:id])
  end

  def index
    @ranks = Rank.all
  end
end
