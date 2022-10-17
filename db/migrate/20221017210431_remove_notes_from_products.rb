class RemoveNotesFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :notes
  end
end
