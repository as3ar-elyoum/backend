class ProductHitLogger
  include Sidekiq::Worker
  sidekiq_options queue: :low_priority, retry: 1

  def perform(product_id, fcm_token)
    ProductHitRepo.new(product_id, fcm_token).create
  end
end
