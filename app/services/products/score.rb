module Products
  class Score
    attr_reader :product

    def initialize(product_id)
      @product = Product.find(product_id)
    end

    def update_score
      product.update_columns(score: calculated_score)
    end

    def calculated_score
      prices_count_score + price_update_at_score + price_change_score
    end

    def prices_count_score
      product.prices.count * 2
    end

    def price_change_score
      prices = product.prices.order(id: :desc).limit(2).pluck(:price)
      return 0 if prices.count < 2

      change_percentag = ((prices.first - prices.last) / prices.last) * 100

      change_percentag.abs.to_i
    end

    def price_update_at_score
      return 0 unless product.price_updated_at

      (Time.now - product.price_updated_at).seconds.in_days.to_i * -1
    end
  end
end
