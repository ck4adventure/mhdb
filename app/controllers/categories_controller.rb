class CategoriesController < ApplicationController
  def index

  end

  def show
    @category = Category.find_by(name: params[:category])
    @items = Item.find_by(category_id: @category.id)
  end
end
