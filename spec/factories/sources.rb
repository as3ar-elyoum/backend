FactoryBot.define do
  factory :source do
    name { Faker::Name.name }
    url { Faker::Internet.url }
  end

  trait :amazon do
    url { 'https://amazon.eg' }
    url_prefix { 'https://amazon.eg' }
  end
end
