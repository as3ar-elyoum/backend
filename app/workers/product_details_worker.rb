class ProductDetailsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :product_details_scraper, retry: 1

  def perform(product_id)
    Scrapers::ProductDetails.new(product_id).perform
  rescue StandardError => e
    error_details = "#{e.message} => #{e.backtrace.first}"
    ProductLog.create(product_id:, notes: error_details)
  end
end
