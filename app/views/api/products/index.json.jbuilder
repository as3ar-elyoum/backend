json.array! @products do |product|
  json.partial! 'products', product:
end
