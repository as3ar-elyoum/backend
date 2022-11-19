module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    # include Elasticsearch::Model::Callbacks

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
end
