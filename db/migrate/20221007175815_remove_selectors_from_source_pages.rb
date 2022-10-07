class RemoveSelectorsFromSourcePages < ActiveRecord::Migration[7.0]
  def change
    remove_column :source_pages, :selectors
  end
end
