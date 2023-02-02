json.array! @categories do |category|
  json.partial! 'category', category:
end
