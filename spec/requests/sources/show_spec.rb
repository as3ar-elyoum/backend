RSpec.describe 'SourcesController', type: :request do
  let!(:source) { create(:source) }

  describe '#show' do
    before do
      get "/sources/#{source.id}"
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:success)
    end
  end
end
