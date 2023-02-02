json.array! @home_data do |record|
  json.partial! 'api/categories/category', category: record[:category]

  json.products do
    json.array! record[:products] do |product|
      json.partial! 'product', product:
    end
  end
end
