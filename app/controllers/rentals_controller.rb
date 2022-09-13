class RentalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @rental_order_information = RentalOrderInformation.new
    if current_user.id == @item.user_id  
      redirect_to root_path
    end
  end

  def create
    @rental_order_information = RentalOrderInformation.new(rental_params)
    if @rental_order_information.valid?
      pay_item
      @rental_order_information.save
      redirect_to root_path
    else
      render "rentals/index"
    end
  end

  private

  def rental_params
    params.require(:rental_order_information).permit(:post_code, :region_id, :city, :address, :building_name, :phone_number,:rental_days_id).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: rental_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
