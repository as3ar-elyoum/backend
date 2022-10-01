FactoryBot.define do
  factory :source do
    name { Faker::Name.name }
    url { Faker::Internet.url }
  end

  trait :amazon do
    url { 'https://amazon.eg' }
    url_prefix { 'https://amazon.eg' }
  end

  trait :carrefour do
    url { 'https://www.carrefouregypt.com/' }
    url_prefix { 'https://www.carrefouregypt.com' }
  end

  trait :jumia do
    url { 'https://www.jumia.com.eg/' }
    url_prefix { 'https://www.jumia.com.eg' }
  end
end
