json.product @products do |product|
  json.partial! 'products', product:
end
