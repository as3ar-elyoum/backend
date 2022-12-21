RSpec.describe Products::Score do
  let(:score_instance) { described_class.new(product.id) }

  context 'when price is not changed' do
    let(:product) { create(:product, :with_source) }

    it 'score is zero' do
      expect(score_instance.prices_count_score).to be_zero
      expect(score_instance.price_update_at_score).to be_zero
      expect(score_instance.price_change_score).to be_zero
    end
  end

  context 'when price is changed one time' do
    let(:product) { create(:product, :with_source) }

    it 'calculates score' do
      product.update(price: 10)
      product.reload.update(price_updated_at: 2.days.ago)

      expect(score_instance.prices_count_score).to eq(0.5)
      expect(score_instance.price_update_at_score).to eq((1 / 2.to_f))
      expect(score_instance.price_change_score).to be_zero

      expect(score_instance.calculated_score).to eq(0.5)
    end
  end

  context 'when price is changed two times' do
    let(:product) { create(:product, :with_source) }

    it 'calculates score' do
      product.update(price: 100)
      product.update(price: 110)
      product.reload.update(price_updated_at: 3.days.ago)

      expect(score_instance.prices_count_score).to eq(2 / 3.0)
      expect(score_instance.price_update_at_score).to eq((1 / 3.to_f))
      expect(score_instance.price_change_score).to eq(10 / 11.0)

      expect(score_instance.calculated_score).to eq(0.656)
    end
  end

  context 'when price is changed three times' do
    let(:product) { create(:product, :with_source) }

    it 'calculates score' do
      product.update(price: 99)
      product.update(price: 100)
      product.update(price: 200)

      product.reload.update(price_updated_at: 6.days.ago)

      expect(score_instance.prices_count_score).to eq(3 / 4.0)
      expect(score_instance.price_update_at_score).to eq((1 / 6.to_f))
      expect(score_instance.price_change_score).to eq(100 / 101.0)
      expect(score_instance.calculated_score).to eq(0.655)
    end
  end
end
