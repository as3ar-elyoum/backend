RSpec.describe ProductFacade do
  describe 'list Products' do
    let(:source) { create(:source) }
    let(:cat1) { create(:category) }
    let(:cat2) { create(:category) }
    let!(:active_products) { create_list(:product, 3, :active, category: cat1, source:) }
    let!(:active_products2) { create_list(:product, 3, :active, category: cat2, source:) }

    context '#all_active' do
      let(:filter) { { filter: { status: 'active' } } }

      it 'list active products' do
        list_of_data = ProductFacade.new(filter).perform
        result_ids = [active_products.pluck(:id) + active_products2.pluck(:id)].flatten.uniq.sort
        expect(list_of_data.pluck(:id).sort).to eq(result_ids)
      end
    end

    context '#active in cat1' do
      let(:filter) { { filter: { status: 'active', category_id: cat1.id } } }

      it 'list active products' do
        list_of_data = ProductFacade.new(filter).perform
        result_ids = active_products.pluck(:id).sort
        expect(list_of_data.pluck(:id).sort).to eq(result_ids)
      end
    end

    context '#active in cat2' do
      let(:filter) { { filter: { status: 'active', category_id: cat2.id } } }

      it 'list active products' do
        list_of_data = ProductFacade.new(filter).perform
        result_ids = active_products2.pluck(:id).sort
        expect(list_of_data.pluck(:id).sort).to eq(result_ids)
      end
    end

    context 'inactive' do
      let(:filter) { { filter: { status: 'inactive' } } }

      let!(:inactive_products) { create_list(:product, 3, :inactive, source:) }

      it 'list inactive products' do
        list_of_data = ProductFacade.new(filter).perform
        expect(list_of_data.pluck(:id).sort).to eq(inactive_products.pluck(:id).sort)
      end
    end
  end
end
