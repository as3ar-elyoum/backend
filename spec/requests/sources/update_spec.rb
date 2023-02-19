RSpec.describe 'SourcesController', type: :request do
  let(:source) { create(:source, name: 'old name') }
  let(:source_config) { create(:source_config, source:) }

  describe '#update' do
    context '#successful' do
      it 'creates a source' do
        expect do
          source.name = 'new name'
          body_params = source.attributes.symbolize_keys
          body_params[:source_config_attributes] = source_config.attributes.symbolize_keys
          put "/sources/#{source.id}", params: { source: body_params }
          expect(response).to have_http_status(:ok)
        end.to change { source.name }.to('new name')
      end
    end

    context '#failure' do
      it 'doesnt create a source' do
        source.name = ''
        body_params = source.attributes.symbolize_keys
        body_params[:source_config_attributes] = source_config.attributes.symbolize_keys
        put "/sources/#{source.id}", params: { source: body_params }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end
end
