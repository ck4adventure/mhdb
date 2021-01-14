class Api::GroupsController < ApplicationController
  # groups won't change so no editing needed
  def index
    @groups = Group.all
    render 'api/groups/index', status: :ok
  end

  def show
    @group = Group.find(params[:id])
    render 'api/groups/show', status: :ok
  end
end
