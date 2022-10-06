class AddNotesToSourcePage < ActiveRecord::Migration[7.0]
  def change
    add_column :source_pages, :notes, :text
  end
end
