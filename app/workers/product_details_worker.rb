class ProductDetailsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :product_details_scraper, retry: 2

  def perform(product_id)
    Scrapers::ProductDetails.new(product_id).perform
  end
end
