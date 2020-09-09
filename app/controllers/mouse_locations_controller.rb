class MouseLocationsController < ApplicationController
  def show
    @ml = MouseLocation.find(params[:id])
  end

  def create
    @ml = MouseLocation.new(ml_params)
    if @ml.save
      redirect_to ml_path(@ml)
    else
      flash.now[:errors] = @ml.errors.full_messages
    end
  end


  def update
    @ml = MouseLocation.find(params[:id])
    if @ml.update(ml_params)
      redirect_to ml_path(@ml)
    else
      flash.now[:errors] = @ml.errors.full_messages
      render :edit
    end
  end

  def destroy
    ml = MouseLocation.find(params[:id])
    ml.destroy
    redirect_to root_path
  end

  private
  def ml_params
    params.require(:ml).permit(:name, :gold, :points)
  end
end
