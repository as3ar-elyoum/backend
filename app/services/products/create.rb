module Products
  class Create
    def self.call(urls, source, source_page)
      urls.map do |url|
        Product.find_or_create_by(url: url) do |product|
          product.source = source
          product.source_page = source_page
        end
      end
    end
  end
end
