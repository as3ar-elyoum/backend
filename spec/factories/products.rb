FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    url { Faker::Internet.url }
    image_url { Faker::Internet.url }
  end
end
