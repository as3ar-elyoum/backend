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
      "title": "h1.css-106scfp", "price": ".css-148pv1t", "image": ".css-1d0skzn img" }'
    end
  end

  trait :jumia_vegetables_page do
    name { 'Vegetables' }
    url { 'https://www.jumia.com.eg/ar/groceries/?tag=FDYJE' }
    selectors do
      '{ "product_urls": "article.prd a",
      "title": ".col10", "price": ".-phs", "image": "#imgs img" }'
    end
  end

  trait :btech_electronics_page do
    name { 'Electronics' }
    url { 'https://btech.com/ar/laptop.html' }
    selectors do
      '{ "product_urls": ".product-item-view a",
      "title": ".base", "price": ".price", "image": "#mtImageContainerMagic img" }'
    end
  end

  trait :noon_televisions_page do
    name { 'Televisions' }
    url { 'https://www.noon.com/egypt-ar/electronics-and-mobiles/television-and-video/televisions/' }
    selectors do
      '{ "product_urls": ".sc-5e739f1b-0 a",
      "title": "#__next h1", "price": ".priceNow", "image": "meta[property=\"og:image\"]" }'
    end
  end
end
