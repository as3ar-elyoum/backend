FactoryBot.define do
    factory :source do
      name { Faker::Name.name }
      url { Faker::Internet.url }
    end
end
  