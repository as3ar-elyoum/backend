class CreateSourcePageLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :source_page_logs do |t|
      t.string :notes
      t.references :source_page, index: true

      t.timestamps
    end
  end
end
