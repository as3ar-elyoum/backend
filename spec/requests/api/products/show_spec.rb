RSpec.describe 'ProductsController#show', type: :request do
  let!(:product) { create(:product, :with_source, :active) }
  let!(:prices) { create_list(:product_price, 2, product:) }

  describe 'GET /api/products/:id' do
    before do
      get "/api/products/#{product.id}"
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
