module Handlers
  class PerformProductCategorize < AbstractHandler
    handles Events::ProductPriceNotPresent

    def execute(event)
      product = Product.find(event.product_id)
      product.update(status: :inactive)
    end
  end
end
