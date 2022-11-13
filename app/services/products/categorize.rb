module Products
  class Categorize
    def self.perform(product_id)
      product = Product.find product_id
      similar = Products::Similar.new(product_id).perform.first
      product.category_id = similar.try(:category_id)
      product.save
    end
  end
end
