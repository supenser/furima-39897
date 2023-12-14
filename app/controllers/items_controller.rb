class ItemsController < ApplicationController
  def index

  end

  def new

  end

  def create
    @item = item.new(item_params)

  end

private

  def item_params
    params.require(:item).permit(:item, :item_text, :category_id, :condition_id, :delivery_cost_id, :area_id, :shipping_alate_id, :price, :image).merge( user_id: current_user.id)
  end

end
