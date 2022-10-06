class SourcePageWorker
  include Sidekiq::Worker
  sidekiq_options queue: :source_page_scraper, retry: 2

  def perform(source_page_id)
    Scrapers::ProductUrls.new(source_page_id).perform
  rescue StandardError => e
    source_page = SourcePage.find(source_page_id)
    error_details = "#{e.message} => #{e.backtrace.first}"
    source_page.update(notes: e.message)
  end
end
