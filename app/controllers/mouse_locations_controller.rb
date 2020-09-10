class MouseLocationsController < ApplicationController

  def new

  end
  
  def create
    if params[:location_id]
      ml = MouseLocation.new(location_id: params[:location_id])
      ml.update(ml_params)
      if ml.save
        redirect_to edit_location_path(ml.location_id)
        return
      else
        flash.now[:errors] = ml.errors.full_messages
        redirect_to edit_location_path(ml.location_id)
        return
      end
    elsif params[:mouse_id]
      ml = MouseLocation.new(mouse_id: params[:mouse_id])
      ml.update(ml_params)
      if ml.save
        redirect_to edit_mouse_path(ml.mouse_id)
        return
      else
        flash.now[:errors] = ml.errors.full_messages
        redirect_to edit_mouse_path(ml.mouse_id)
        return
      end
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
    if params[:location_id]
      redirect_to edit_location_path(ml.location_id)
      return
    elsif params[:mouse_id]
      redirect_to edit_mouse_path(ml.mouse_id)
      return
    end
    redirect_to root_path
  end

  private
  def ml_params
    params.require(:mouselocation).permit(:location_id, :mouse_id)
  end
end
