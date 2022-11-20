module Events
  class ProductPriceNotPresent
    attr_reader :product_id

    def initialize(product_id:)
      @product_id = product_id
    end
  end
end
