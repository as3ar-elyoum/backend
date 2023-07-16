RSpec.describe 'SourcePagesController', type: :request do
  let(:source) { create(:source) }
  let(:source_page) { build(:source_page, source:) }

  describe '#create' do
    context '#successful' do
      it 'creates a source page' do
        expect do
          source_page_params = source_page.attributes.symbolize_keys
          post "/sources/#{source_page.source_id}/source_pages", params: { source_page: source_page_params }
          expect(response).to have_http_status(:created)
        end.to change(SourcePage, :count).by(1)
      end
    end

    context '#failure' do
      let(:source_page) { build(:source_page, source:, name: nil) }
      it 'doesnt create a source page' do
        expect do
          source_page_params = source_page.attributes.symbolize_keys
          post "/sources/#{source_page.source_id}/source_pages", params: { source_page: source_page_params }
          expect(response).to render_template(:new)
          expect(response).to have_http_status(:unprocessable_entity)
        end.not_to change(SourcePage, :count)
      end
    end
  end
end
