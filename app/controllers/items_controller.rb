class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show ]


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:description,:category_id,:day_to_ship_id,:image).merge(user_id: current_user.id)
  end

end