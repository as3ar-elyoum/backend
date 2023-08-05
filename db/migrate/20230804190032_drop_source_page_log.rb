class DropSourcePageLog < ActiveRecord::Migration[7.0]
  def change
    drop_table :source_page_logs
  end
end
