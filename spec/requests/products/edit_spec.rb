RSpec.describe 'ProductsController', type: :request do
    let(:product) { create(:product, :with_source) }
    describe '#index' do
        before do
            get "/products"
        end
        it 'returns status code 200' do
            expect(response.status).to eq 200
        end
    end


    describe '#show' do
        before do
            get "/products/#{product.id}"
        end
        it 'returns status code 200' do
            expect(response.status).to eq 200
        end
    end


    describe '#edit' do
        before do
            get "/products/#{product.id}/edit"
        end
        it 'returns status code 200' do
            expect(response.status).to eq 200
        end
    end


    describe '#scrap' do
        let(:product_details_worker) { double(ProductDetailsWorker) }

        before do
            post "/products/#{product.id}/scrap"
            allow(product).to receive(:enqueue_scraper_worker).and_return(product_details_worker)
            allow(product_details_worker).to receive(:perform_async)
        end

        it "enqueues the SourcePageWorker" do
            expect(product.enqueue_scraper_worker).to eq(product_details_worker)
        end
    end

end