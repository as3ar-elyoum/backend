task train_categories: :environment do
  Category.where.not(keywords: nil).each do |category|
    keywords = category.keywords.split("\n")
    keywords.each do |keyword|
      result = Products::Search.new(keyword).perform
      result.update_all(category_id: category.id)
    end
  end
end
