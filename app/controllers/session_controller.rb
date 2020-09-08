class SessionController < ApplicationController
  before_action :require_no_user, only: %i(create new)

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
    render :new
  end

  def destroy
    logout_user!
    redirect_to root_path
  end
end
