class ProductsCheckWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 2

  def perform
    Product.inactive.order('RANDOM()').each(&:enqueue_scraper_worker)
    Product.active.order('RANDOM()').each(&:enqueue_scraper_worker)
  end
end
