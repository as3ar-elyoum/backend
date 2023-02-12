RSpec.describe Products::Home do
    let(:source) { create(:source) }
    let(:active_category) { create(:category, active: true) }
    let(:inactive_category) { create(:category, active: false) }
    let(:active_product) { create(:product, source:, status: :active, category: active_category) }
    let(:inactive_product) { create(:product, source:, status: :inactive, category: active_category) }

    before do
        active_product
        inactive_product
    end
    

    context 'perform' do
        subject { described_class.new.perform }

        it 'returns only active categories' do
            is_expected.to match_array([{ category: active_category, products: [active_product]}])
        end

        it 'filters products based on status and category' do
            allow(ProductFacade).to receive(:new).and_return(double(perform: [active_product]))

            is_expected.to match_array([{ category: active_category, products: [active_product]}])

            expect(ProductFacade).to have_received(:new).with({ filter: { status: :active, category_id: active_category.id } })
        end
    end
end
