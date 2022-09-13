class RentalsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end

  def create
    @rental = Rental.create(rental_params)
    order_information.create(order_information_params)
    redirect_to root_path
  end

  private

  def rental_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  end

end
