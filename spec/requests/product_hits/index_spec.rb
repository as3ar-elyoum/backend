RSpec.describe 'ProductHitsController', type: :request do

  describe '#index' do
    it 'renders index template' do
      get '/product_hits'
      expect(response).to have_http_status(:success)
    end
  end
end
