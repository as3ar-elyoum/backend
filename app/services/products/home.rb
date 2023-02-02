module Products
  class Home
    def filter_products
      filter = { filter: { status: :active, category_id: @category.id } }
      @products = ProductFacade.new(filter).perform

    end

    def perform
       Category.all.map do |category|
        @category =category
        {
        category: @category,
        products: @products= filter_products
        }
      end
    end

end
end
