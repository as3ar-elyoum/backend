class ProductsCheckWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 2
  MAX_PRODCUTS_COUNT = 300
  LATENCY_LIMIT = 60 * 5
  def perform
    return if exceeds_latency_limit?

    products = Product.enabled.order(updated_at: :asc).limit(MAX_PRODCUTS_COUNT)
    products.update_all(updated_at: Time.now)
    products.each(&:enqueue_scraper_worker)
  end

  def exceeds_latency_limit?
    Sidekiq::Queue.new('product_details_scraper').latency > LATENCY_LIMIT
  end
end
