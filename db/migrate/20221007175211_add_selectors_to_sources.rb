class AddSelectorsToSources < ActiveRecord::Migration[7.0]
  def change
    add_column :sources, :selectors, :text
  end
end
