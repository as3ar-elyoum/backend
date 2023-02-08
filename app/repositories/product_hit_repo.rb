class ProductHitRepo
  attr_reader :product, :device

  def initialize(product_id, token)
    @device = Device.find_by(fcm_token: token)
    @product = Product.find product_id
  end

  def create
    ProductHit.create(product_id: product.id, device_id: device&.id)
  end
end
