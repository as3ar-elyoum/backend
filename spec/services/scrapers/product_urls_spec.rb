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

  context 'when the source is carrefour' do
    let(:carrefour_source) { create(:source, :carrefour) }
    let(:carrefour_vegetables_page) { create(:source_page, :carrefour_vegetables_page, source: carrefour_source) }
    it 'returns product urls' do
      product_urls = Scrapers::ProductUrls.new(carrefour_vegetables_page.id).perform
      expect(product_urls).to be_an_instance_of(Array)
      expect(product_urls.empty?).to be_falsey
    end
  end

  context 'when the source is jumia' do
    let(:jumia_source) { create(:source, :jumia) }
    let(:jumia_vegetables_page) { create(:source_page, :jumia_vegetables_page, source: jumia_source) }
    it 'returns product urls' do
      product_urls = Scrapers::ProductUrls.new(jumia_vegetables_page.id).perform
      expect(product_urls).to be_an_instance_of(Array)
      expect(product_urls.empty?).to be_falsey
    end
  end
end
