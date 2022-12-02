module Products
  class Score
    attr_reader :product

    def initialize(product_id)
      @product = Product.find(product_id)
    end

    def update_score
      product.update(score: calculated_score)
    end

    private

    def calculated_score
      prices_count_score + price_update_at_score
    end

    def prices_count_score
      product.prices.count * 2
    end

    def price_update_at_score
      1 - (Time.now - product.price_updated_at).seconds.in_days.to_i / 7
    end
  end
end
