module Products
  class Categorize
    def self.perform(product_id)
      return
      product = Product.find product_id

      similars = Products::Search.new(product.name).perform
      grouped_by_category = similars.records.group(:category_id).count
      the_common_category = grouped_by_category.invert.compact.max&.last
      product.category_id = the_common_category
      return if product.category_id.nil?

      product.save
    end
  end
end
