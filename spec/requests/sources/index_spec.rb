RSpec.describe SourcesController, type: :controller do
  let!(:source) { create(:source) }

  describe '#index' do
    before do
      get :index
    end
    it 'render sources template with status code 200' do
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end
end
