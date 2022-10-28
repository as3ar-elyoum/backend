class ProductsCheckWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 2
  MAX_PRODCUTS_COUNT = 150
  def perform
    products = Product.order(updated_at: :asc).limit(MAX_PRODCUTS_COUNT)

    products.update_all(updated_at: Time.now)
    products.each(&:enqueue_scraper_worker)
  end
end
