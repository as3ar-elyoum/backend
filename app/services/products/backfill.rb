module Products
  class Backfill
    def self.perform
      products = Product.active.where(price_updated_at: nil).order(id: :asc).find_each do |product|
        product.update_columns(price_updated_at: product.prices.last&.created_at,
                               prices_count: product.prices.count)
      end
    end
  end
end
