class RemoveSelectorsFromSources < ActiveRecord::Migration[7.0]
  def change
    remove_column :sources, :selectors, :text
  end
end
