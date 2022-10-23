module Events
  class ProductUrlsFetched
    attr_reader :source_page_id, :products_urls

    def initialize(source_page_id:, products_urls:)
      @source_page_id = source_page_id
      @products_urls = products_urls
    end

    def payload
      {
        source_page_id:,
        products_urls:
      }
    end
  end
end
