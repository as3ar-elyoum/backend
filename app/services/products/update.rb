module Products
  class Update
    def self.call(product_id, product_details)
      Product.update(product_id,product_details)
    end
  end
end
