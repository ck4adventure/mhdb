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
  
  end
  def edit
  
  end

  def update
  
  end

  def destroy
  
  end
end
