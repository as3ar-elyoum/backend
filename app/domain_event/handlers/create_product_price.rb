module Handlers
  class CreateProductPrice < AbstractHandler
    handles Events::ProductPriceChanged

    def execute(event)
      product = Product.find(event.product_id)
      product.prices.create(price: event.price)
    end
  end
end
