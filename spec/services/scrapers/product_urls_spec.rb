RSpec.describe Scrapers::ProductUrls do
  let!(:source) { create(:source) }
  let!(:source_config) { create(:source_config, source:) }
  let!(:source_page) { create(:source_page, source:) }

  let(:scraper) { described_class.new(source_page.id, 0) }
  let(:file_path) { "#{Rails.root}/spec/fixtures/scraped_data/tv.amazon.eg.html" }
  let(:page_content) { File.read(file_path) }
  let(:mechanize_page) do
    Mechanize::Page.new(URI::HTTP.build(url: source_page.url), nil, page_content, 200, Mechanize.new)
  end

  before do
    described_class.any_instance.stub(:fetch_document).and_return(mechanize_page)
  end

  context '#scraping' do
    it do
      scraper.perform
    end
  end
end
