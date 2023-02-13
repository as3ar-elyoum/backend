RSpec.describe Products::Home do
  describe '#perform' do
    context 'when there are two active categories' do
      let(:active_category) { create(:category) }
      let!(:inactive_category) { create(:category, :inactive) }
      let!(:active_products) { create_list(:product, 2, :with_source, :active, category: active_category) }
      let!(:inactive_products) { create_list(:product, 2, :with_source, :inactive, category: active_category) }

      subject { described_class.new.perform }

      it 'load home data' do
        is_expected.to match_array([{ category: active_category, products: active_products }])
      end
    end
  end
end
