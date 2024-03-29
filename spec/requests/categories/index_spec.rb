RSpec.describe CategoriesController, type: :controller do
  let!(:category) { create(:category) }
  let(:valid_attributes) do
    { category: { name: category.name, keywords: 'test, category', icon: 'fa fa-test', active: true } }
  end

  describe '#index' do
    before do
      get :index
    end
    it 'returns status code 200' do
      expect(response).to render_template(:index)
      expect(response.status).to eq 200
    end
  end
  
end
