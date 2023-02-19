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

  describe '#show' do
    before do
      get :show, params: { id: category.id }
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
      expect(response.status).to eq 200
    end
  end

  describe '#new' do
    before do
      get :new
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe '#destroy' do
    it 'deletes the category' do
      expect { delete :destroy, params: { id: category.id } }.to change(Category, :count).by(-1)
      expect(response).to redirect_to(categories_path)
    end
  end
end
