json.array! @products do |product|
  json.partial! 'api/products/product', product:
end
