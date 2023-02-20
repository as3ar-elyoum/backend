RSpec.describe 'CategoriesController', type: :request do
  let(:category) { build(:category) }

  describe '#create' do
    context '#successful' do
      it 'creates a category' do
        expect do
          category_params = category.attributes.symbolize_keys
          post '/categories', params: { category: category_params }
          expect(response).to have_http_status(:created)
        end.to change(Category, :count).by(1)
      end
    end

    context '#failure' do
      let(:category) { build(:category, name: nil) }
      it 'doesnt create a source' do
        expect do
          category_params = category.attributes.symbolize_keys
          post '/categories', params: { category: category_params }

          expect(response).to have_http_status(:unprocessable_entity)
        end.not_to change(Category, :count)
      end
    end
  end
end
