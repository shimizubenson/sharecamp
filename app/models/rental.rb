class Rental < ApplicationRecord
 
  belongs_to :user
  belongs_to :item
  has_one :order_information
end
