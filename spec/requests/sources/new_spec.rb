RSpec.describe 'SourcesController', type: :request do
  let!(:source) { create(:source) }

  describe '#new' do
    before do
      get '/sources/new'
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:success)
    end
  end
end
