module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    settings settings_attributes do
      mappings dynamic: false do
        indexes :name, type: :text
      end
    end

    def as_indexed_json(_options = {})
      as_json(only: %i[name source_id])
    end

    def self.search(search_definition)
      __elasticsearch__.search(search_definition)
    end

    after_commit do
      __elasticsearch__.index_document if indexable?
      __elasticsearch__.delete_document if disabled?
    end

    after_destroy do
      __elasticsearch__.delete_document if disabled?
    end
  end

  class_methods do
    def settings_attributes
      { index: { analysis: {
        analyzer: {
          autocomplete: {
            type: :custom, tokenizer: :standard, filter: %i[lowercase autocomplete]
          },
          filter: { autocomplete: { type: :edge_ngram, min_gram: 2, max_gram: 25 } }
        }
      } } }
    end
  end
end
