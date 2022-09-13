FactoryBot.define do
  factory :rental_order_information do
    post_code            { '123-4567' }
    region_id            {2}
    city                 { '東京都' }
    address              { '1-1' }
    building_name        { '東京ハイツ' }
    phone_number         {"1234567890"}
    rental_days_id       {2}
    association :user
    association :item
  end
end
