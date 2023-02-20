RSpec.describe 'SourcePagesController', type: :request do
    let!(:source) {create(:source)}
    let!(:source_page) {create(:source_page, source:)}

    describe '#new' do
        before do
            get "/sources/#{source.id}/source_pages/new"
        end
        it 'returns status code 200' do
            expect(response.status).to eq 200
        end
    end
end