class ItemStatsController < ApplicationController
  def show
  
  end

  def new
    @istat = ItemStat.new()
  end

  def create
    @istat = ItemStat.new()
  end

  def edit
    @istat = ItemStat.find(params[:id])
  end

  def update
    @istat = ItemStat.find(params[:id])
  end
end
