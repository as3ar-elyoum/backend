RSpec.describe 'ProductsController', type: :request do
  let(:product) { create(:product, :with_source) }
  let(:category) { create(:category) }

  before do
    Product.any_instance.stub(:check_similar_category)
  end

  describe '#update' do

    context "with valid parameters" do
      it "updates the product" do
        product.update(price: 10.0, category_id: category.id, status: 'active') 
        product_params = product.attributes.symbolize_keys     
        put "/api/products/#{product.id}", params: { product: product_params }
        product.reload
        expect(product.status).to eq("active")
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when update fails' do
      it 'renders the product errors' do
        put "/api/products/#{product.id}", params: { product: { status: '', category_id: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end
end
