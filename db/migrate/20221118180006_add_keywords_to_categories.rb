class AddKeywordsToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :keywords, :text
  end
end
