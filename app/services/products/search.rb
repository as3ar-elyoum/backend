module Products
  class Search
    def self.perform(query)
      Product.search(query)
    end
  end
end
