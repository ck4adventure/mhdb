class Api::UsersController < ApplicationController
  # before_action :require_signed_out!, only: [:new, :create]
  # before_action :require_signed_in!, only: [:edit, :update, :destroy]
  
  def show
    @user = User.find(params[:id])
    render 'api/users/show'
  end
  
  def create
    @user = User.new(user_params)
    if @user.save!
      login_user!(@user)
      render 'api/users/show', status: 200
    else
      render json: @user.errors.full_messages, status: 401
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      render 'api/users/show'
    else
      render json: @user.errors.full_messages, status: 401
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { message: "User successfully deleted" }, status: 200
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :rank_id)
  end
end
