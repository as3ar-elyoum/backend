class ProductsCheckWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 2
  MAX_PRODCUTS_COUNT = 200
  def perform
    products = Product.order(updated_at: :asc)
.limit(MAX_PRODCUTS_COUNT)

    products.update_all(created_at: Time.now)
    product.each(&:enqueue_scraper_worker)
  end
end
