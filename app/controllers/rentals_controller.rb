class RentalsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end

  def create
    @rental_order_infomation = RentalOrderInfomation.new(rental_params)
    if @rental_order_infomation.valid?
      @rental_order_infomation.save
      redirect_to root_path
    else
      render "rentals/index"
    end
  end

  private

  def rental_params
    params.require(:rental_order_infomation).permit(:post_code, :region, :city, :address, :building_name, :phone_number,:rental_days).merge(item_id: params[:item_id],user_id: current_user.id)
  end

  

end
