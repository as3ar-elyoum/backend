class RemoveActiveFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :active
  end
end
