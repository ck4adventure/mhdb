class Api::MiceController < ApplicationController
  def show
    @mouse = Mouse.find(params[:id])
    render '/api/mice/show'
  end
end
