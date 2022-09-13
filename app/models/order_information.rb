class OrderInformation < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :rental 
  belongs_to :region
  belongs_to :rental_days
end
