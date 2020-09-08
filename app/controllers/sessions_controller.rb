class SessionsController < ApplicationController
  before_action :require_signed_out!, only: %i(create new)
  before_action :require_signed_in!, only: :destroy

  def create
    user = User.find_by(email: params[:user][:email])

    if user.nil?
      flash.now[:errors] = ["Email not on file. You may need to sign up."]
      render :new
    else
      login_user!(user)
      redirect_to root_path
    end
  end

  def new
    @user = User.new()
    render :new
  end

  def destroy
    logout_user!
    redirect_to root_path
  end
end
