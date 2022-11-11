module Facade
  class Product
    def load(_params)
      Product.includes(:source, :source_page)
             .order(updated_at: :desc).first(100)
    end
  end
end
