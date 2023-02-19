FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    url { Faker::Internet.url }
    image_url { Faker::Internet.url }
  end

  trait :active do
    status { :active }
    price { Faker::Number.number(digits: 3) }
  end
  trait :inactive do
    status { :inactive }
  end

  trait :with_source do
    source { create(:source) }
  end
end
