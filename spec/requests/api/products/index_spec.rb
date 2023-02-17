RSpec.describe 'ProductsController#index', type: :request do
  let!(:products) { create_list(:product, 5, :with_source, :active) }

  describe '#index' do
    before do
        get '/api/products'
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns products with filter' do; end

  end
end
