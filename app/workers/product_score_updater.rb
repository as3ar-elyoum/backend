class ProductScoreUpdater
  include Sidekiq::Worker
  sidekiq_options queue: :product_score, retry: 2

  def perform(product_id)
    Products::Score.new(product_id).update_score
  end
end
