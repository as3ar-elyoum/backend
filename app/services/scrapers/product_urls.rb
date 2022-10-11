module Scrapers
  class ProductUrls
    URL_REGEXP = %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix

    def initialize(source_page_id, page_number)
      @page_number = page_number
      @source_page = SourcePage.find source_page_id
      @source = @source_page.source
      @url_prefix = @source.url_prefix.to_s
      @url = @source_page.url
      @url = @url.gsub('page_number', @page_number.to_s) if @source_page.paginated?
      @selectors = @source_page.parsed_selectors
    end

    def perform
      @document = fetch_document
      @urls = fetch_urls
      Products::Create.call(@urls, @source, @source_page)
      scraped_at = Time.now
      @source_page.update(scraped_at: scraped_at)
      SourcePageWorker.perform_async(@source_page.id, @page_number + 1) if can_paginate?
    end

    def fetch_urls
      urls = @document.search @selectors['product_urls']
      urls = urls.map(&:values).flatten.uniq
      urls = urls.map { |url| @url_prefix + url }
      urls = urls.select { |url| url.match? URL_REGEXP }

      urls.map do |url|
        url = URI.parse(url)
        url.query = nil
        url.to_s.gsub(/ref=[a-z]+_[0-9]+_[0-9]+/, '')
      end
    end

    def fetch_document
      mechanize_agent = Mechanize.new
      mechanize_agent.user_agent_alias = 'Linux Mozilla'
      @document = mechanize_agent.get(@url)
      @document.encoding = 'utf-8'
      @document
    end

    def can_paginate?
      @source_page.paginated? && !@urls.empty? && @page_number <= 500
    end
  end
end
