class AddPaginatedColumnToSourcePages < ActiveRecord::Migration[7.0]
  def change
    add_column :source_pages, :paginated, :boolean, default: false
  end
end
