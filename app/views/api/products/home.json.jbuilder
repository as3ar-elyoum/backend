
json.array! @categorized_products do |category|
    json.id category.id
    json.name category.name
    json.icon category.icon_path
     
    json.array! category.products do |product|
        json.partial! 'product', product: product
    end
end