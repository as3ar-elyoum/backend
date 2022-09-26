class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.string :url_prefix
      t.boolean :active
      t.timestamps
    end
  end
end
