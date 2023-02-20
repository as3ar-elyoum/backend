RSpec.describe 'ProductsController', type: :request do
  let(:product) { create(:product, :with_source) }
  let(:category) { create(:category) }

  before do
    Product.any_instance.stub(:check_similar_category)
  end

  describe '#update' do
    context 'when updating successfully' do
      it 'updates the product' do
        product.update(price: 10.0, category_id: category.id)   
        product_params = product.attributes.symbolize_keys     
        put "/products/#{product.id}", params: { product: product_params }
        expect(response).to have_http_status(:ok)
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
