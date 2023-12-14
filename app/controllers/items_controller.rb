class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def item_params
    params.require(:item).permit(:image, :item, :item_text, :category_id, :condition_id, :delivery_cost_id, :area_id, :shipping_date_id, :price ).merge( user_id: current_user.id)
  end

end
