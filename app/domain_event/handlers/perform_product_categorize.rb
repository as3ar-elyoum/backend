module Handlers
  class PerformProductCategorize < AbstractHandler
    handles Events::ProductDetailsFetched

    def execute(event)
      Products::Categorize.perform(event.product_id)
    end
  end
end
