class MouseLocationsController < ApplicationController

  def new
    @mouse = Mouse.find(params[:mouse_id])
    @mouselocation = MouseLocation.new(mouse_id: params[:mouse_id])
  end
  
  def create
    @mouselocation = MouseLocation.new(mouse_id: params[:mouse_id])
    @mouselocation.update(ml_params)
    if @mouselocation.save
      redirect_to edit_mouse_path(@mouselocation.mouse_id)
    else
      flash.now[:errors] = @mouselocation.errors.full_messages
    end
  end


  def update
    @mouselocation = MouseLocation.find(params[:id])
    if @mouselocation.update(ml_params)
      redirect_to mouse_path(@mouselocation.mouse_id)
    else
      flash.now[:errors] = @mouselocation.errors.full_messages
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
    params.require(:mouselocation).permit(:location_id)
  end
end
