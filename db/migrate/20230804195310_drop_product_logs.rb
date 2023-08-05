class DropProductLogs < ActiveRecord::Migration[7.0]
  def change
    drop_table :product_logs
  end
end
