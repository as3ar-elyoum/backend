RSpec.describe Scrapers::ProductDetails do
  context 'when the source is amazon' do
    let(:amazon_source) { create(:source, :amazon) }
    let(:amazon_iphone_page) { create(:source_page, :amazon_iphone_page, source: amazon_source) }
    let(:product) { create(:product, :amazon_iphone_product, source: amazon_source, source_page: amazon_iphone_page) }

    it 'returns product urls' do
      updated_product = Scrapers::ProductDetails.new(product.id).perform
      expect(updated_product.id).to eq(product.id)
      expect(updated_product.price).not_to be_nil
      expect(updated_product.name).not_to be_nil
      expect(updated_product.image_url).not_to be_nil
      expect(updated_product.product_prices.empty?).to be_falsey
    end
  end
end
