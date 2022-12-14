FactoryBot.define do
  factory :source_config do
    products_url_selector { '.a-link-normal.s-no-outline' }
    name_selector { '#productTitle' }
    image_url_selector { '#imgTagWrapperId img' }
    price_selector do
      '#corePriceDisplay_desktop_feature_div .a-price-whole | .a-price.a-text-price.a-size-medium.apexPriceToPay span'
    end
  end
end
