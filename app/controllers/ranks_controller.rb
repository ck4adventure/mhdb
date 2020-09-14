class RanksController < ApplicationController
  before_action :require_signed_in!, except: [:index, :show]
  def show
    @rank = Rank.find(params[:id])
  end

  def index
    @ranks = Rank.all
  end
end
