module Products
  class Update
    def self.call(product_id, product_details)
      product = Product.find(product_id)
      product.update(product_details.merge(active: true, updated_at: Time.now))
      product
    end
  end
end
