json.product @products do |product|
  json.partial! 'products', product: product
end