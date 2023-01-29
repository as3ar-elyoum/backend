module Products
  class Home
   def initialize(category_id)
      @category = Category.find category_id
    end

    def perform
      filter = { filter: { status: :active, category_id: @category.id } }
      @products = ProductFacade.new(filter).perform
    end
  end
end
