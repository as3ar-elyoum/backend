FactoryBot.define do
  factory :product_price do
    price { Faker::Number.number(digits: 3) }
    product { create(:product) }
  end
end
