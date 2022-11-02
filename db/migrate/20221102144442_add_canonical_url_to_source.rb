class AddCanonicalUrlToSource < ActiveRecord::Migration[7.0]
  def change
    add_column :sources, :canonical_url, :boolean, default: false
  end
end
