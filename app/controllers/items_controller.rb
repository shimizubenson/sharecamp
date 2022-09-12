class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index ]


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    if  current_user.admin == false
      redirect_to root_path
    else
      render :new
    end
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