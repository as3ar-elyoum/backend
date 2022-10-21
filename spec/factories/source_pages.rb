FactoryBot.define do
  factory :source_page do
    name { Faker::Name.name }
    url { Faker::Internet.url }
  end
end
