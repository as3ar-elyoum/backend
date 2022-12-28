class ProductHitLogger
  include Sidekiq::Worker
  sidekiq_options queue: :low_priority, retry: 1

  def perform(product_id, device_uid)
    ProductHitRepo.new(product_id, device_uid).create
  end
end
