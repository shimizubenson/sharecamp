FactoryBot.define do
  factory :item do
    name                    {'item'}
    image                   {Faker::Lorem.sentence}
    description             {2}
    category_id             {2}
    day_to_ship_id          {2}
    price                   {'300'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
