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
      product.prices.last&.change_percentage&.abs || 0
    end

    def price_update_at_score
      return 0 unless product.price_updated_at

      (Time.now - product.price_updated_at).seconds.in_days.to_i * -1
    end
  end
end
