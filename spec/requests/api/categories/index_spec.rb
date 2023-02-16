RSpec.describe 'CategoriesController', type: :request do
  let!(:categories) { create_list(:category, 5) }

  describe 'GET /api/categories/index' do
    before do
      get '/api/categories'
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
