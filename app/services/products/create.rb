module Products
  class Create
    def self.call(urls, source_page_id)
      source_page = SourcePage.find source_page_id
      urls.map do |url|
        Product.find_or_create_by(url:) do |product|
          product.source = source_page.source
          product.source_page = source_page
        end
      end
    end
  end
end
