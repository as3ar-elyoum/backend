RSpec.describe 'SourcePagesController', type: :request do
    let!(:source) {create(:source)}
    let!(:source_page) {create(:source_page, source:)}

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