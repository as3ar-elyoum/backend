class ProductsCheckWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 2
  MAX_PRODCUTS_COUNT = 100
  def perform
    Product.active.order(updated_at: :asc)
           .first(MAX_PRODCUTS_COUNT).each(&:enqueue_scraper_worker)
  end
end
