class ProductDetailsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :product_details_scraper, retry: 1

  def perform(product_id)
    Scrapers::ProductDetails.new(product_id).perform
  rescue StandardError => e
    product = Product.find(product_id)
    error_details = "#{e.message} => #{e.backtrace.first}"
    product.update(notes: error_details)
  end
end
