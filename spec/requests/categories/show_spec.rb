RSpec.describe CategoriesController, type: :controller do
  let!(:category) { create(:category) }
  let(:valid_attributes) do
    { category: { name: category.name, keywords: 'test, category', icon: 'fa fa-test', active: true } }
  end

  describe '#show' do
    before do
      get :show, params: { id: category.id }
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
      expect(response.status).to eq 200
    end
  end
end
