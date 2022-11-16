FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    url { Faker::Internet.url }
    image_url { Faker::Internet.url }
  end

  trait :active do
    status { :active }
  end
  trait :inactive do
    status { :inactive }
  end
end
