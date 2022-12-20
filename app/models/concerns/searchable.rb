module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    settings settings_attributes do
      mappings dynamic: false do
        indexes :name, type: :text
        indexes :score, type: :float
      end
    end

    def as_indexed_json(_options = {})
      as_json(only: %i[name score])
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
        "filter": {
          "arabic_stop": {
            "type": 'stop',
            "stopwords": '_arabic_'
          },
          "arabic_keywords": {
            "type": 'keyword_marker',
            "keywords": ['مثال']
          },
          "arabic_stemmer": {
            "type": 'stemmer',
            "language": 'arabic'
          }
        },
        analyzer: {
          "rebuilt_arabic": {
            "tokenizer": 'standard',
            "filter": %w[
              lowercase
              decimal_digit
              arabic_stop
              arabic_normalization
              arabic_keywords
              arabic_stemmer
            ]
          }
        }
      } } }
    end
  end
end
