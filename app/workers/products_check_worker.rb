class ProductsCheckWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 2

  def perform
    Product.all.each(&:enqueue_scraper_worker)
  end
end
