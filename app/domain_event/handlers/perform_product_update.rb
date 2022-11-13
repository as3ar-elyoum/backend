module Handlers
  class PerformProductUpdate < AbstractHandler
    handles Events::ProductDetailsFetched

    def execute(event)
      Products::Update.call(event.product_id, event.details)
    end
  end
end
