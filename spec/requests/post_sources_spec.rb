require 'rails_helper'

RSpec.describe 'Sources', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_source) { FactoryBot.create(:source) }

      before do
        post '/sources', params:
                          { source: {
                            name: my_source.name,
                            url: my_source.url
                          } }
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/sources', params:
                          { source: {
                            name: '',
                            url: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
