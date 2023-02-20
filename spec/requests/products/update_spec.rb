RSpec.describe 'ProductsController', type: :request do
    let!(:product) { create(:product, :with_source) }
    let!(:category) { create(:category) }

    before do
        allow_any_instance_of(Product).to receive(:check_similar_category)
    end

    describe '#update' do
        xcontext 'when updating successfully' do
            it 'updates the product and redirects to the edit page' do
                product.category_id = category.id
                product.status = 'active'
                product_params = product.attributes.symbolize_keys        
                put "/products/#{product.id}", params: { product: product_params }
                expect(product.status).to eq('active')
                expect(product.category_id).to eq(category.id)
                expect(response).to have_http_status(:ok)
                expect(product).to have_received(:check_similar_category)
        end
    end

    context 'when update fails' do
      it 'renders the edit template with status unprocessable_entity' do
        put "/products/#{product.id}", params: { product: { status: '', category_id: '' } }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end
end
