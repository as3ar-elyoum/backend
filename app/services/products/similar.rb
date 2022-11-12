module Products
  class Similar
    def initialize(product_id)
      @search_definition = {
        size: 10,
        query: { bool: { must: [], should: [], filter: [], must_not: [] } }
      }
      @set_filters = lambda do |context_type, filter|
        @search_definition[:query][:bool][context_type] |= [filter]
      end
      @product = Product.find(product_id)
      query = @product.name
      @set_filters.call(:must, match: { name: { query:, fuzziness: 1 } })
      @set_filters.call(:must_not, [{ terms: { _id: [@product.id] } }])
    end

    def perform
      Product.active.includes(:source, :source_page).search(@search_definition).records
    end
  end
end
