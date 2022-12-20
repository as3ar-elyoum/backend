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
      index_document if indexable?
      delete_document if disabled?
    end

    def index_document
      __elasticsearch__.index_document
    end

    def delete_document
      __elasticsearch__.delete_document
    end

    after_destroy do
      delete_document
    end
  end

  class_methods do
    def settings_attributes
      { index: { analysis: {
        analyzer: {
          arabic_analyzer: {
            type: :custom, tokenizer: :arabic, filter: %i[arabic_stop]
          }
        }
      } } }
    end
  end
end
