class RentalDays < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1週間' }
  ]
  include ActiveHash::Associations
  has_many :items
end