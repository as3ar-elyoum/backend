RSpec.describe 'SourcePagesController', type: :request do
    let!(:source) {create(:source)}
    let!(:source_page) {create(:source_page, source:)}

    describe '#destroy' do
        before do
            delete "/sources/#{source.id}/source_pages/#{source_page.id}"
        end

        it "deletes the source page" do
            expect(SourcePage.find_by(id: source_page.id)).to be_nil
            expect(response).to redirect_to(source_source_pages_path)
        end
    end
end