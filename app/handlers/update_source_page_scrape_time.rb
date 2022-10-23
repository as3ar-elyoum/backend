module Handlers
  class UpdateSourcePageScrapTime < AbstractHandler
    handles Events::ProductUrlsFetched

    def execute(event)
      source_page = SourcePage.find(event.source_page_id)
      source_page.update(scraped_at: Time.now)
    end
  end
end
