class RentalOrderInfomation
  include ActiveModel::Model
  attr_accessor :post_code,:region_id,:city,:address,:building_name,:phone_number,:rental_days_id,:item_id,:user_id,

  with_options presence: true do
   validates :city,:address,:user_id,:item_id,:
   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にハイフォン（-）を入力してください"}
   validates :region_id, numericality: { other_than: 1, message: "を入力してください" }
   validates :rental_days_id, numericality: { other_than: 1, message: "を入力してください" } 
   validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end

  def save
  rental = Rental.create(item_id: item_id, user_id: user_id)
  OrderInffomation.create(post_code: post_code, region: region, city: city, address: address building_name: building_name, phone_number: phone_number,rental_days: rental_days, rental_id: rental.id)
  end
end
