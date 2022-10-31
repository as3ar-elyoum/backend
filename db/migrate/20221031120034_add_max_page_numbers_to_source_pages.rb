class AddMaxPageNumbersToSourcePages < ActiveRecord::Migration[7.0]
  def change
    add_column :source_pages, :max_page_numbers, :integer, default: 0
  end
end
