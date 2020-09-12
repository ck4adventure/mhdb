class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:category])
    @items = Item.find_by(category_id: @category.id)
  end
end
