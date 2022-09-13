class RentalDays < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '3泊4日' },
    { id: 3, name: '1週間' },
    { id: 4, name: '月額利用' }
  ]
  include ActiveHash::Associations
  has_many :items
end