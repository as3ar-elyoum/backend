class SourcePageWorker
  include Sidekiq::Worker
  sidekiq_options queue: :source_page_scraper, retry: 2

  def perform(source_page_id)
    begin
      Scrapers::ProductUrls.new(source_page_id).perform
    rescue => e
      source_page = SourcePage.find(source_page_id)
      source_page.update(status: e.message)
    end
  end
end
