module Products
  class Search
    def self.perform(query)
      term = query[:term]
      Product.active.includes(:source, :source_page)
        .search(term)
        .records
    end
  end
end
