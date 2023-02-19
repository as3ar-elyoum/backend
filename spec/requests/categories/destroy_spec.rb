RSpec.describe CategoriesController, type: :controller do
  let!(:category) { create(:category) }
  let(:valid_attributes) do
    { category: { name: category.name, keywords: 'test, category', icon: 'fa fa-test', active: true } }
  end

  describe '#destroy' do
    it 'deletes the category' do
      expect { delete :destroy, params: { id: category.id } }.to change(Category, :count).by(-1)
      expect(response).to redirect_to(categories_path)
    end
  end
end
