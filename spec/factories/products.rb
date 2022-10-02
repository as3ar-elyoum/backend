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
    url { 'https://www.noon.com/egypt-ar/toshiba-4k-smart-frameless-led-tv-55-inch-with-built-in-receiver-55u5965ea-black/N40855040A/p/?o=b4496a48bee794ad' }
  end

  trait :carrefour_product do
    name { nil }
    url { 'https://www.carrefouregypt.com/mafegy/ar/root-maf-category//fruits-vegetables-herbs/vegetables/tomato/a-tomato-local/p/32631?list_name=category%7Cfruits-vegetables-rounded' }
  end

  trait :btech_laptop_product do
    name { nil }
    url { 'https://btech.com/ar/lenovo-ideapad-3-intel-n4020-15-6-1tb-freedos-grey.html' }
  end

  trait :jumia_product do
    name { nil }
    url { 'https://www.jumia.com.eg/ar/flour-1kg-aldoha-mpg860489.html' }
  end
end
