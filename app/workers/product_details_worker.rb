class ProductDetailsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :product_details_scraper, retry: 1

  def perform(product_id)
    begin
      Scrapers::ProductDetails.new(product_id).perform
    rescue => e
      product = Product.find(product_id)
      product.update(status: e.message)
    end
  end
end
