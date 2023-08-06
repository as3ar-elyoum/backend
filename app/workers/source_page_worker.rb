class SourcePageWorker
  include Sidekiq::Worker
  sidekiq_options queue: :source_page_scraper, retry: 2

  def perform(source_page_id, page_number = 0)
    Scrapers::ProductUrls.new(source_page_id, page_number).perform
  end
end
