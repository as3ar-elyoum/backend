module Products
  class Search
    def initialize(query)
      @search_definition = {
        size: 50,
        query: { bool: { must: [], should: [], filter: [], must_not: [] } }
      }
      @set_filters = lambda do |context_type, filter|
        @search_definition[:query][:bool][context_type] |= [filter]
      end
      @set_filters.call(:must, match: { name: { query:, fuzziness: 1 } })
    end

    def perform
      Product.active.includes(:source, :source_page).search(@search_definition).records
    end
  end
end
