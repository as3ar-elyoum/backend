module Products
  class Backfill
    def self.perform
      products = Product.order(id: :asc).find_each do |product|
        product.price_updated_at = product.prices.last.created_at
        product.prices_count = product.prices.count

        product.save
      rescue StandardError => e
      end
    end
  end
end
