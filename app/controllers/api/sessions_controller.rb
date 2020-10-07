class Api::SessionsController < ApplicationController
  # before_action :require_signed_out!, only: :create
  # before_action :require_signed_in!, only: :destroy

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user.nil?
      render :json ["Email not on file. You may need to sign up."], status: 401
    else
      login_user!(@user)
      render 'api/users/show'
    end
  end

  def destroy
    logout_user!
    render json: { message: 'Logout successful.' }, status: 200
  end
end
