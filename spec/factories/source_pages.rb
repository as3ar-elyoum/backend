FactoryBot.define do
  factory :source_page do
    name { Faker::Name.name }
    url { Faker::Internet.url }
  end

  trait :amazon_iphone_page do
    url { 'https://www.amazon.eg/s?bbn=21832883031&rh=n%3A21832883031%2Cp_89%3AApple&pf_rd_i=21832883031&pf_rd_m=A1ZVRGNO5AYLOV&pf_rd_p=3791cc79-77bb-4e44-a238-b42dd45cafcd&pf_rd_r=49SG1HGGBHW9N8D3Y5DT&pf_rd_s=merchandised-search-14&pf_rd_t=101&ref=s9_acss_bw_cg_ATF1208_3a1_w' }
    selectors do
      '{ "product_urls": ".a-link-normal.s-no-outline", "title": "#productTitle", "price": "#corePriceDisplay_desktop_feature_div .a-price-whole", "image": "#imgTagWrapperId img" }'
    end
  end

  trait :carrefour_vegetables_page do
    name { 'Vegetables' }
    url { 'https://www.carrefouregypt.com/mafegy/ar/c/fruits-vegetables-rounded' }
    selectors do
      '{ "product_urls": ".css-14tfefh ul a",
      "title": "#productTitle", "price": "#corePriceDisplay_desktop_feature_div .a-price-whole", "image": "#imgTagWrapperId img" }'
    end
  end

  trait :jumia_vegetables_page do
    name { 'Vegetables' }
    url { 'https://www.jumia.com.eg/ar/groceries/?tag=FDYJE' }
    selectors do
      '{ "product_urls": "article.prd a",
      "title": "#productTitle", "price": "#corePriceDisplay_desktop_feature_div .a-price-whole", "image": "#imgTagWrapperId img" }'
    end
  end
end
