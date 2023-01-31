module Products
  class Home
    def perform
      filter = { filter: { status: :active, category_id: @category.id } }
      @products = ProductFacade.new(filter).perform

    end

    def recommended
      home = Category.all.map do |category|
        @category =category
        {
        category: @category,
        products: @products= perform
        }
      end
    end

end
end
