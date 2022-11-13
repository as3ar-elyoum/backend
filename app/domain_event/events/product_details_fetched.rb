module Events
  class ProductDetailsFetched
    attr_reader :product_id, :details

    def initialize(product_id:, details:)
      @product_id = product_id
      @details = details
    end
  end
end
