class AddCategoryReferenceToSourcePages < ActiveRecord::Migration[7.0]
  def change
    add_reference(:source_pages, :category, index: true)
  end
end
