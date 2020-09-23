class Api::ItemsController < ApplicationController
  before_action :require_signed_in!, except: [:index, :show, :category]
  def index
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
  end

  def category 
    @category = Category.find_by(name: params[:category])
    @items = Item.where(category_id: @category.id)
    @item = Item.new(category_id: @category.id)
  end

  def new
    @item = Item.new()
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to category_page_path(@item.category.name)
    else
      flash.now[:errors] = @item.errors.full_messages
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      flash.now[:errors] = @item.errors.full_messages
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :le, :category_id, :power, :p_bonus, :attr_bonus, :luck, :cheese_effect, :power_type)
  end
end
