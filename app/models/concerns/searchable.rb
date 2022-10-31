module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    def as_indexed_json(_options = {})
      as_json(only: %i[name])
    end

    settings settings_attributes do
      mappings dynamic: false do
        indexes :name, type: :text, analyzer: :autocomplete
      end
    end

    def self.search(query)
      set_filters = lambda do |context_type, filter|
        @search_definition[:query][:bool][context_type] |= [filter]
      end

      @search_definition = {
        size: 5,
        query: {
          bool: {
            must: [],
            should: [],
            filter: []
          }
        }
      }

      set_filters.call(:must, match: { name: { query:, fuzziness: 1 } })

      __elasticsearch__.search(@search_definition)
    end
  end

  class_methods do
    def settings_attributes
      {
        index: {
          analysis: { analyzer: {
            autocomplete: {
              type: :custom, tokenizer: :standard, filter: %i[lowercase autocomplete]
            },
            filter: {
              autocomplete: { type: :edge_ngram, min_gram: 2, max_gram: 25 }
            }
          } }
        }
      }
    end
  end
end