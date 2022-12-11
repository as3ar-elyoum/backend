module Handlers
  class PerformProductUpdate < AbstractHandler
    handles Events::ProductDetailsFetched

    def execute(event)
      ProductRepo.new(event.product_id).update(event.details)
    end
  end
end
