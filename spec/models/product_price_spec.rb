RSpec.describe ProductPrice, type: :model do
  before do
    Product.any_instance.stub(:update_score)
    Product.any_instance.stub(:enqueue_scraper_worker)
  end

  context '#validations' do
    it { is_expected.to validate_numericality_of(:price) }
  end

  context '#relations' do
    it { is_expected.to belong_to :product }
  end

  context 'when price is created' do
    let!(:product) { create(:product, :with_source) }

    it 'updates product prices count and price_updated_at' do
      expect(product.prices.count).to eq(0)
      expect(product.prices_count).to eq(nil)
      expect(product.price_updated_at).to eq(nil)

      product.update(price: 10)
      product.reload
      expect(product.prices.count).to eq(1)
      expect(product.prices_count).to eq(1)
      expect(product.price_updated_at).not_to eq(nil)

      expect(product.prices.last.change_percentage).to eq(0)
    end
  end

  context 'when price is changed twice' do
    let!(:product) { create(:product, :with_source) }

    it 'updates change_percentage' do
      product.update(price: 100)
      product.update(price: 110)
      product.reload

      expect(product.prices.last.change_percentage).to eq(10)
    end
  end

  context 'when price is changed twice' do
    let!(:product) { create(:product, :with_source) }

    it 'updates change_percentage' do
      product.update(price: 90)
      product.update(price: 100)
      product.update(price: 98)
      product.reload

      expect(product.prices.last.change_percentage).to eq(-2)
    end
  end
end
