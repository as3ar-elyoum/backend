class ProductHitRepo
  attr_reader :product, :device

  def initialize(product_id, device_uid)
    @device = Device.find_by(device_id: device_uid)
    @product = Product.find product_id
  end

  def create
    ProductHit.create(product_id: product.id, device_id: device&.id)
  end
end
