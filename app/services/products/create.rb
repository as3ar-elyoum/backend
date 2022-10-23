module Products
  class Create
    def self.call(urls, source_page)
      urls.map do |url|
        Product.find_or_create_by(url:) do |product|
          product.source = source_page.source
          product.source_page = source_page
        end
      end
    end
  end
end
