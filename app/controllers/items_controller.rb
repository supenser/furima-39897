class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :ensure_current_user, only: [:edit, :update, :destroy ]
  before_action :set_item, only: [:show, :edit, :update, :destroy ]


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


private

  def item_params
    params.require(:item).permit(:image, :item, :item_text, :category_id, :condition_id, :delivery_cost_id, :area_id, :shipping_date_id, :price ).merge( user_id: current_user.id)
  end

  def ensure_current_user
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end



end
