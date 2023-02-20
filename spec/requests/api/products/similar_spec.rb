RSpec.describe 'ProductsController#show', type: :request do
  let(:source) { create(:source) }
  let(:product) { create(:product, source:) }
  let(:similar_products) { create_list(:product, 3, category: product.category, source:) }
    
  before do
    (Products::Similar).any_instance.stub(perform: similar_products)
  end
  
  describe '#similar' do
    context '#successfully' do
      it 'returns a list of similar products' do
        get "/api/products/#{product.id}/similar", params: { id: product.id }
        expect(assigns(:products)).to eq(similar_products)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
