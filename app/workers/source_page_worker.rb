class SourcePageWorker
  include Sidekiq::Worker
  sidekiq_options queue: :source_page_scraper, retry: 2

  def perform(source_page_id, page_number = 0)
    Scrapers::ProductUrls.new(source_page_id, page_number).perform
  rescue StandardError => e
    source_page = SourcePage.find(source_page_id)
    error_details = "#{e.message} => #{e.backtrace.first}"
    source_page.update(notes: error_details)

    SourcePageWorker.perform_async(source_page.id, page_number + 1) if source_page.paginated? && page_number <= 500
  end
end
