RSpec.describe 'SourcesController', type: :request do
  let(:source) { create(:source) }
  let(:source_page) { create(:source_page, source: source, name: 'old name') }

  describe '#update' do
    context '#successful' do
      it 'updates a source page' do
        expect do
          source_page.name = 'new name'
          source_page_params = source_page.attributes.symbolize_keys
          put "/sources/#{source_page.source_id}/source_pages/#{source_page.id}", params: { source_page: source_page_params }
          expect(response).to have_http_status(:ok)
        end.to change { source_page.name }.to('new name')
      end
    end

    context '#failure' do
      it 'doesnt update a source page' do
        source_page.name = ''
        source_page_params = source_page.attributes.symbolize_keys
        put "/sources/#{source_page.source_id}/source_pages/#{source_page.id}", params: { source_page: source_page_params }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end
end
