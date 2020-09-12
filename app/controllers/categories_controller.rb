class CategoriesController < ApplicationController
  def index

  end

  def show
    @cat = Category.find_by(name: params[:category])
    @items = Items.find_by(category_id: @cat.id)
  end
end
