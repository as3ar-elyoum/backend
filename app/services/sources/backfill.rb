module Sources
    class Backfill 
        def self.perform
            Source.all.each do |source|
                selectors = source.parsed_selectors
                config = SourceConfig.new(
                    name_selector: selectors['title'],
                    price_selector: selectors['price'],
                    description_selector: selectors['description'],
                    image_url_selector: selectors['image'],
                    products_url_selector: selectors['product_urls']
                )
                byebug
                config.update(source_id: source.id)
                config.save
            end
        end
    end
end