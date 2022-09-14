class Item < ApplicationRecord
  validates :name, :description,:image,             presence: true
  validates :category_id, numericality:    { other_than: 1,message: "を入力してください" } 
  validates :day_to_ship_id, numericality: { other_than: 1,message: "を入力してください" } 
  validates :price, presence: true, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :day_to_ship
  has_one :rental
  has_one_attached :image
end
