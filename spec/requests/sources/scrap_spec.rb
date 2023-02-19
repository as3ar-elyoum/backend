RSpec.describe 'SourcesController', type: :request do
  let!(:source) { create(:source) }

  describe '#scrap' do
    before do
      allow(Source).to receive(:find).and_return(source)
      allow(source).to receive(:enqueue_scraper)
    end

    it 'enqueues scraper on the source' do
      expect(source).to receive(:enqueue_scraper)
      post "/sources/#{source.id}/scrap"
    end
  end
end
