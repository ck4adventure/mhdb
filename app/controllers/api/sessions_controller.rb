class Api::SessionsController < ApplicationController
  before_action :require_signed_out!, only: :create
  before_action :require_signed_in!, only: :destroy

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login_user!(@user)
      render 'api/users/show'
    else
      render json: ["Email not on file. You may need to sign up."], status: 401
    end
  end

  def destroy
    logout_user!
    render json: { message: 'Logout successful.' }, status: 200
  end
end
