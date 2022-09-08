class Item < ApplicationRecord
  validates :name, :description,:image,             presence: true
  validates :category_id, numericality:    { other_than: 1,message: "を入力してください" } 
  validates :day_to_ship_id, numericality: { other_than: 1,message: "を入力してください" } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :day_to_ship
  has_one_attached :image
end
