class StaticPagesController < ApplicationController
  def main
    @users = User.all
  end
end
