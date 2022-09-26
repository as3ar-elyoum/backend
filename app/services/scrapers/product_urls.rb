module Scrapers
  class ProductUrls
    URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

    def initialize(source_page_id)
      @source_page = SourcePage.find source_page_id
      @url_prefix = @source_page.source.url_prefix.to_s
      @url = @source_page.url
    end

    def perform
      @document = fetch_document
      fetch_product_links
    end

    def fetch_product_links
      links = @document.search '.product-item-view a'
      links = links.map(&:values).flatten.uniq
      puts @url_prefix
      puts links.last
      links = links.map { |item| @url_prefix + item }
      puts links.last
      links.select { |url| url.match? URL_REGEXP }
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
