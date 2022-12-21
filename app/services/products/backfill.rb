module Products
  class Backfill
    def self.perform
      Product.active.categorized.each do |product|
        Products::Score.new(product.id).update_score
      end
    end
  end
end
