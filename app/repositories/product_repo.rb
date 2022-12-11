class ProductRepo
  attr_reader :product

  def initialize(id)
    @product = Product.find(id)
  end

  def update(details)
    product.update(details.merge(status: :active, updated_at: Time.now))
  end
end
