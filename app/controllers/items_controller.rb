class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  private

  def items_params
    params.require(:item).permit(, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
