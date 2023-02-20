RSpec.describe CategoriesController, type: :controller do
  let!(:category) { create(:category) }
  let(:valid_attributes) do
    { category: { name: category.name, keywords: 'test, category', icon: 'fa fa-test', active: true } }
  end

  describe '#new' do
    before do
      get :new
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end
  
end
