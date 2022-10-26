json.array! @products do |product|
    json.partial! 'product', product:
end
  