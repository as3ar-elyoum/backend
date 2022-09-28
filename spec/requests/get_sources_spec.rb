require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # let!(:sources) { create_list(:source, 20) }

  describe 'GET /index' do
    before do
      get '/sources'
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
