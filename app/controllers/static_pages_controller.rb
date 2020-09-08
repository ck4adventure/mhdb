class StaticPagesController < ApplicationController
  def main
    @users = User.all
    @ranks = Rank.all
    @locations = Location.all
  end
end
