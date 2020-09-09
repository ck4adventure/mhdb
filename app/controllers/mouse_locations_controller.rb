class MouseLocationsController < ApplicationController

  def new
  end
  
  def create
    @ml = MouseLocation.new(ml_params)
    if @ml.save
      redirect_to mouse_path(@ml.mouse_id)
    else
      flash.now[:errors] = @ml.errors.full_messages
    end
  end


  def update
    @ml = MouseLocation.find(params[:id])
    if @ml.update(ml_params)
      redirect_to mouse_path(@ml.mouse_id)
    else
      flash.now[:errors] = @ml.errors.full_messages
      render :edit
    end
  end

  def destroy
    ml = MouseLocation.find(params[:id])
    ml.destroy
    redirect_to mouse_path(ml.mouse_id)
  end

  private
  def ml_params
    params.require(:ml).permit(:mouse_id, :location_id)
  end
end
