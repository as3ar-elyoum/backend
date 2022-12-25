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
      total = (prices_count_score + price_update_at_score + price_change_score)

      (total / (total + 1)).floor(3)
    end

    def prices_count_score
      prices_count = product.prices.count

      prices_count / (prices_count + 1).to_f
    end

    def price_change_score
      change_percentage = product.prices.last&.change_percentage&.abs || 0.0

      change_percentage / (change_percentage + 1).to_f
    end

    def price_update_at_score
      return 0.0 unless product.price_updated_at

      1 / (Time.now - product.price_updated_at).seconds.in_days.to_f
    end
  end
end
