class CreateSourcePages < ActiveRecord::Migration[7.0]
  def change
    create_table :source_pages do |t|
      t.string :name
      t.string :url
      t.boolean :active
      t.string :selectors
      t.references :source, index: true

      t.timestamps
    end
  end
end
