class ItemsController < ApplicationController

  def index
    @items = Item.roots
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params[:item].permit(:title, :parent_id, :position)
  end
end
