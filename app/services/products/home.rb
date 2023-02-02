module Products
  class Home
    def perform
      Category.all.map do |category|
        {
          category:,
          products: filter_products(category)
        }
      end
    end

    private

    def filter_products(category)
      filter = { filter: { status: :active, category_id: category.id } }
      ProductFacade.new(filter).perform
    end
  end
end
