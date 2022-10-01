RSpec.describe Scrapers::ProductDetails do
  context 'when the source is amazon' do
    let(:amazon_source) { create(:source, :amazon) }
    let(:amazon_iphone_page) { create(:source_page, :amazon_iphone_page, source: amazon_source) }
    let(:product) { create(:product, :amazon_iphone_product, source: amazon_source, source_page: amazon_iphone_page) }

    it 'returns product details' do
      updated_product = Scrapers::ProductDetails.new(product.id).perform
      expect(updated_product.id).to eq(product.id)
      expect(updated_product.price).not_to be_nil
      expect(updated_product.name).not_to be_nil
      expect(updated_product.image_url).not_to be_nil
      expect(updated_product.product_prices.empty?).to be_falsey
    end
  end

  context 'when the source is noon' do
    let(:noon_source) { create(:source, :noon) }
    let(:noon_televisions_page) { create(:source_page, :noon_televisions_page, source: noon_source) }
    let(:product) { create(:product, :noon_tv_product, source: noon_source, source_page: noon_televisions_page) }

    it 'returns product details' do
      updated_product = Scrapers::ProductDetails.new(product.id).perform
      expect(updated_product.id).to eq(product.id)
      expect(updated_product.price).not_to be_nil
      expect(updated_product.name).not_to be_nil
      expect(updated_product.image_url).not_to be_nil
      expect(updated_product.product_prices.empty?).to be_falsey
      byebug
    end
  end
end
