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

  context 'when the source is carrefour' do
    let(:carrefour_source) { create(:source, :carrefour) }
    let(:carrefour_vegetables_page) { create(:source_page, :carrefour_vegetables_page, source: carrefour_source) }
    let(:product) { create(:product, :carrefour_product, source: carrefour_source, source_page: carrefour_vegetables_page) }

    it 'returns product details' do
      updated_product = Scrapers::ProductDetails.new(product.id).perform
      expect(updated_product.id).to eq(product.id)
      expect(updated_product.price).not_to be_nil
      expect(updated_product.name).not_to be_nil
      expect(updated_product.image_url).not_to be_nil
      expect(updated_product.product_prices.empty?).to be_falsey
    end
  end

  context 'when the source is btech' do
    let(:btech_source) { create(:source, :carrefour) }
    let(:btech_laptop_page) { create(:source_page, :btech_electronics_page, source: btech_source) }
    let(:product) { create(:product, :btech_laptop_product, source: btech_source, source_page: btech_laptop_page) }

    it 'returns product details' do
      updated_product = Scrapers::ProductDetails.new(product.id).perform
      expect(updated_product.id).to eq(product.id)
      expect(updated_product.price).not_to be_nil
      expect(updated_product.name).not_to be_nil
      expect(updated_product.image_url).not_to be_nil
      expect(updated_product.product_prices.empty?).to be_falsey
    end
  end

  context 'when the source is jumia' do
    let(:jumia_source) { create(:source, :jumia) }
    let(:jumia_vegetables_page) { create(:source_page, :jumia_vegetables_page, source: jumia_source) }
    let(:product) { create(:product, :jumia_product, source: jumia_source, source_page: jumia_vegetables_page) }

    it 'returns product details' do
      updated_product = Scrapers::ProductDetails.new(product.id).perform
      expect(updated_product.id).to eq(product.id)
      expect(updated_product.price).not_to be_nil
      expect(updated_product.name).not_to be_nil
      expect(updated_product.image_url).not_to be_nil
      expect(updated_product.product_prices.empty?).to be_falsey
    end
  end

end
