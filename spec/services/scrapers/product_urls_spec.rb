RSpec.describe Scrapers::ProductUrls do
  context 'when the source is amazon' do
    let(:amazon_source) { create(:source, :amazon) }
    let(:amazon_iphone_page) { create(:source_page, :amazon_iphone_page, source: amazon_source) }
    it 'returns product urls' do
      product_urls = Scrapers::ProductUrls.new(amazon_iphone_page.id).perform
      expect(product_urls).to be_an_instance_of(Array)
      expect(product_urls.empty?).to be_falsey
    end
  end
end
