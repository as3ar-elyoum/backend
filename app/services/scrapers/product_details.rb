module Scrapers
  class ProductDetails
    URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

    def initialize(product_id)
      @product = Product.find product_id
      @source_page = @product.source_page
      @selectors = @source_page.parsed_selectors
      @url = @product.url
    end

    def perform
      @document = fetch_document
      name = fetch_title
      price = fetch_price
      image_url = fetch_image
      product_details = { name: name, price: price, image_url: image_url }
      Products::Update.call(@product.id, product_details)
    end

    def fetch_title
      @document.search(@selectors['title']).first.text.strip
    end

    def fetch_price
      @document.search(@selectors['price']).first.text.delete('^0-9.').to_f
    end

    def fetch_image
      @document.search(@selectors['image']).map(&:values).flatten.select { |value| value.match? URL_REGEXP }.first
    end

    def fetch_description
      @document.search('#accordion').text.strip
    end

    def fetch_document
      mechanize_agent = Mechanize.new
      mechanize_agent.user_agent_alias = 'Mac Safari'
      @document = mechanize_agent.get(@url)
      @document.encoding = 'utf-8'
      @document
    end
  end
end
