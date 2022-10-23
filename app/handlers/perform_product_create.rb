module Handlers
  class PerformProductCreate < AbstractHandler
    handles Events::ProductUrlsFetched

    def execute(event)
      Products::Create.call(event.products_urls, event.source_page_id)
    end
  end
end
