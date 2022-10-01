FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    url { Faker::Internet.url }
  end

  trait :amazon_iphone_product do
    name { nil }
    url { 'https://www.amazon.eg/%D9%85%D9%88%D8%A8%D8%A7%D9%8A%D9%84-%D8%A7%D9%8A%D9%81%D9%88%D9%86-Max%D8%8C-%D8%AC%D9%8A%D8%AC%D8%A7%D8%A8%D8%A7%D9%8A%D8%AA%D8%8C-%D8%B3%D9%8A%D9%8A%D8%B1%D8%A7/dp/B09G9CD8PS/ref=sr_1_3?pf_rd_i=21832883031&pf_rd_m=A1ZVRGNO5AYLOV&pf_rd_p=3791cc79-77bb-4e44-a238-b42dd45cafcd&pf_rd_r=49SG1HGGBHW9N8D3Y5DT&pf_rd_s=merchandised-search-14&pf_rd_t=101&qid=1664545254&refinements=p_89%3AApple&s=electronics&sr=1-3' }
  end

  trait :noon_tv_product do
    name { nil }
    url { 'https://www.noon.com/egypt-ar/32-inch-hd-led-tv-3222a-black/N25937075A/p/?o=d135e85bf7718e1f' }
  end
end
