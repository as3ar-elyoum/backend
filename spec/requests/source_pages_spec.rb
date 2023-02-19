RSpec.describe 'SourcePagesController', type: :request do
    let!(:source) {create(:source)}
    let!(:source_page) {create(:source_page, source:)}

    describe '#index' do
        before do
            get "/sources/#{source.id}/source_pages"
        end
        it 'returns status code 200' do
            expect(response.status).to eq 200
        end
    end

    describe '#new' do
        before do
            get "/sources/#{source.id}/source_pages/new"
        end
        it 'returns status code 200' do
            expect(response.status).to eq 200
        end
    end

    describe '#destroy' do
        before do
            delete "/sources/#{source.id}/source_pages/#{source_page.id}"
        end

        it "deletes the source page" do
            expect(SourcePage.find_by(id: source_page.id)).to be_nil
            expect(response).to redirect_to(source_source_pages_path)
        end
    end

    describe '#scrap' do
        let(:source_page_worker) { double(SourcePageWorker) }

        before do
            post "/sources/#{source.id}/source_pages/#{source_page.id}/scrap"
            allow(source_page).to receive(:enqueue_scraper).and_return(source_page_worker)
            allow(source_page_worker).to receive(:perform_async)
        end

        it "enqueues the SourcePageWorker" do
            expect(source_page.enqueue_scraper).to eq(source_page_worker)
        end
    end
end