module Scrapers
  class ProductUrls
    URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

    def initialize(source_page_id)
      @source_page = SourcePage.find source_page_id
      @source = @source_page.source
      @url_prefix = @source.url_prefix.to_s
      @url = @source_page.url
      @selectors = @source_page.parsed_selectors
    end

    def perform
      @document = fetch_document
      links = fetch_product_links
      Products::Create.call(links, @source, @source_page)
    end

    def fetch_product_links
      links = @document.search @selectors['product_urls']
      links = links.map(&:values).flatten.uniq
      links = links.map { |item| @url_prefix + item }
      links.select { |url| url.match? URL_REGEXP }
    end

    def fetch_document
      mechanize_agent = Mechanize.new
      mechanize_agent.user_agent_alias = 'Linux Mozilla'
      @document = mechanize_agent.get(@url)
      @document.encoding = 'utf-8'
      @document
    end
  end
end
