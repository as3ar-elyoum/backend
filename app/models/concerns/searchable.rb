module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    def as_indexed_json(_options = {})
      return {} unless indexable?

      as_json(only: %i[name source_id category_id])
    end

    def self.search(search_definition)
      __elasticsearch__.search(search_definition)
    end
  end
end
