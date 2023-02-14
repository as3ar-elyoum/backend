RSpec.shared_examples 'load home data' do
  it 'loads active categories with active products in each' do
    is_expected.to match_array(expected_result)
  end
end

RSpec.xdescribe Products::Home do
  describe '#perform' do
    context 'when there are two active categories' do
      let(:active_category) { create(:category) }
      let!(:inactive_category) { create(:category, :inactive) }
      let!(:active_products) { create_list(:product, 2, :with_source, :active, category: active_category) }
      let!(:inactive_products) { create_list(:product, 2, :with_source, :inactive, category: active_category) }

      subject { described_class.new.perform }

      let(:expected_result) do
        [{ category: active_category, products: active_products }]
      end
      it_behaves_like 'load home data'
    end
  end
end
