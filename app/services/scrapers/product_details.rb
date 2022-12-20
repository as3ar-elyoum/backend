module Scrapers
  class ProductDetails
    URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

    attr_reader :product

    def initialize(product_id)
      @product = Product.find product_id
      @source = product.source
      @source_config = @source.source_config
      @url = product.url
    end

    def perform
      @document = fetch_document
      name = fetch_title
      price = fetch_price
      image_url = fetch_image
      description = fetch_description
      product_details = { name:, price:, image_url:, description: }

      unless price
        event = Events::ProductPriceNotPresent.new(product_id: product.id)
        DomainEvent::Publisher.publish(event)
        return
      end

      event = Events::ProductDetailsFetched.new(product_id: product.id, details: product_details)
      DomainEvent::Publisher.publish(event)
      product
    end

    def fetch_title
      @document.search(@source_config.name_selector).first.text.strip
    end

    def fetch_price
      selectors = @source_config.price_selector.split('|').map(&:strip)

      return nil unless selectors.present?

      selectors.each do |selector|
        return @document.search(selector).first.text.delete('^0-9.').to_f
      rescue StandardError => e
      end

      nil
    end

    def fetch_image
      @document.search(@source_config.image_url_selector).map(&:values).flatten
               .select { |url| url.match? URL_REGEXP }.first
    end

    def fetch_description
      @document.search(@source_config.description_selector).text.strip
    end

    def fetch_document
      mechanize_agent = Mechanize.new
      mechanize_agent.user_agent_alias = 'Linux Mozilla'
      document = mechanize_agent.get(@url)
      document.encoding = 'utf-8'
      document
    end
  end
end
