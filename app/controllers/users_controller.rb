class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new()
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
    end
  end
  
  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :id)
  end
end
