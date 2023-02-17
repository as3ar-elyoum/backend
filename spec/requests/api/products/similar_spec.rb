RSpec.describe 'ProductsController#show', type: :request do
  let!(:products) { create_list(:product, 5, :with_source, :active) }

  describe 'GET /api/products/:id' do
    before do
      # get "/api/products/#{products.first.id}"
    end
    it 'returns status code 200' do
      # expect(response).to have_http_status(:success)
    end
  end
end
