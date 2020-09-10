class MousesController < ApplicationController
  def index
    @mice = Mouse.all
  end

  def show
    @mouse = Mouse.find(params[:id])
  end

  def new
    
  end

  def create
    @mouse = Mouse.new(mouse_params)
    if @mouse.save
      redirect_to mouse_path(@mouse)
    else
      flash.now[:errors] = @mouse.errors.full_messages
      render :new
    end
  end
  def edit
    @mouse = Mouse.find(params[:id])
  end

  def update
    @mouse = Mouse.find(params[:id])
    if @mouse.update(mouse_params)
      redirect_to mouse_path(@mouse)
    else
      flash.now[:errors] = @mouse.errors.full_messages
      render :edit
    end
  end

  def destroy
    mouse = Mouse.find(params[:id])
    mouse.destroy
    redirect_to mice_url
  end

  private
  def mouse_params
    params.require(:mouse).permit(
      :name, 
      :gold, 
      :points, )
  end
end
