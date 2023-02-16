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

  describe "#show" do
    before { 
      get :show, params: {id: source.id}
    }

    it "renders the show template" do
        expect(response).to render_template(:show)
        expect(response).to have_http_status(:success)
    end
  end

  describe "#new" do
    before do
        get :new
    end

    it "renders the new template" do            
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:success)
    end
  end
end
