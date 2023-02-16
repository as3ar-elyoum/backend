RSpec.describe 'ProductsController', type: :request do
  let!(:products) { create_list(:product, 5, :with_source, :active) }

  describe 'GET /api/products/home' do
    before do
      get '/api/products/home'
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
