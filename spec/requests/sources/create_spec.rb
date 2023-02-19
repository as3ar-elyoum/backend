RSpec.describe 'SourcesController', type: :request do
  let(:source) { build(:source) }
  let(:source_config) { build(:source_config, source:) }

  describe '#create' do
    context '#successful' do
      it 'creates a source' do
        expect do
          body_params = source.attributes.symbolize_keys
          body_params[:source_config_attributes] = source_config.attributes.symbolize_keys
          post '/sources', params: { source: body_params }
          expect(response).to have_http_status(:created)
        end.to change(Source, :count).by(1)
      end
    end

    context '#failure' do
      let(:source) { build(:source, name: nil) }
      it 'doesnt create a source' do
        expect do
          body_params = source.attributes.symbolize_keys
          body_params[:source_config_attributes] = source_config.attributes.symbolize_keys
          post '/sources', params: { source: body_params }

          expect(response).to have_http_status(:unprocessable_entity)
        end.not_to change(Source, :count)
      end
    end
  end
end
