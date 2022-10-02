class SourcePageWorker
  include Sidekiq::Worker
  sidekiq_options queue: :source_page_scraper, retry: 2

  def perform(source_page_id)
    Scrapers::ProductUrls.new(source_page_id).perform
  end
end
